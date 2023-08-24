
import 'package:todoflutter/calendar/screens/event.dart';
import 'package:todoflutter/calendar/screens/sputil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:lunar/lunar.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:todoflutter/calendar/screens/sputil.dart';

import 'historydata.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  final calendarStyle = const CalendarStyle();
  // final style = const Style();

  final _eventInputController = TextEditingController();
  var _hts = <String, HistoryData>{};

  bool _showTodayOfHistory = true;

  @override
  void initState() {
    super.initState();

    rootBundle.loadString('assets/HTAll.json').then((value) {
      var ds = json.decode(value) as Map<String, dynamic>;
      _hts = ds.map((key, value) => MapEntry(key, HistoryData.fromJson(value)));
      setState(() {});
    });

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));
    _showTodayOfHistory = SpUtils.getString('switchHistoryToday') != '0';
  }

  @override
  void dispose() {
    _eventInputController.dispose();
    _selectedEvents.dispose();
    super.dispose();
  }

  String lunarMonthDayText(DateTime day) {
    Lunar lunarDate = Lunar.fromDate(day);
    if (lunarDate.getDay() == 1) {
      return '${lunarDate.getMonth()}';
    }

    return lunarDate.getDayInChinese();
  }


  String cellText(DateTime day) {
    var text = '${day.day}';

    Lunar lunarDate = Lunar.fromDate(day);
    var festivals = lunarDate.getFestivals();
    if (festivals.isEmpty) {
      Solar solarDate = Solar.fromDate(day);
      festivals = solarDate.getFestivals();
    }
    if (festivals.isEmpty) {
      var s = lunarDate.getJieQi();
      if (s != '') {
        festivals = <String>[s];
      }
    }
    if (festivals.isEmpty) {
      var shujiu = lunarDate.getShuJiu();
      if (shujiu != null && shujiu.getIndex() == 1) {
        festivals = <String>[shujiu.getName()];
      }
    }
    if (festivals.isEmpty) {
      var fu = lunarDate.getFu();
      if (fu != null && fu.getIndex() == 1) {
        festivals = <String>[fu.getName()];
      }
    }
    if (festivals.isNotEmpty) {
      text += '\n${festivals.first}';
    } else if (lunarDate.getDay() == 1) {
      text += '\n${lunarDate.getMonthInChinese()}月';
    } else {
      text += '\n${lunarDate.getDayInChinese()}';
    }

    return text;
  }

  String daySPKey(DateTime day) {
    return '${day.year}_${day.month}_${day.day}';
  }

  List<Event> _getEventsForDay(DateTime day) {
    var events = SpUtils.getStringList(daySPKey(day));
    if (events == null) {
      return [];
    }
    return events.map((e) => Event(e)).toList();
  }

  void _removeEventsForDay(DateTime day, int index, String text) {
    var events = SpUtils.getStringList(daySPKey(day));
    if (events == null) {
      return;
    }
    if (events.length <= index) {
      return;
    }

    if (events[index] != text) {
      return;
    }

    events.removeAt(index);

    SpUtils.putStringList(daySPKey(day), events);

    setState(() {});
  }

  void __addEvensForDay(DateTime day, String event) {
    showModalBottomSheet(
        isScrollControlled: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                child: TextFormField(
                  maxLines: 3,
                  autofocus: true,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Event Name',
                  ),
                  controller: _eventInputController,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_eventInputController.text == '') {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              // Retrieve the text the that user has entered by using the
                              // TextEditingController.
                              content: Text('Pliz Enter Event Name '),
                            );
                          },
                        );
                        return;
                      }
                      var events = SpUtils.getStringList(daySPKey(day));
                      events ??= [];
                      events.add(_eventInputController.text);
                      SpUtils.putStringList(daySPKey(day), events);
                      _eventInputController.text = '';
                      Navigator.pop(context);
                      setState(() {});
                    },
                    child: const Text('Save'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              )
            ],
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    _selectedEvents.value = _getEventsForDay(_selectedDay);

    var lunarDate = Lunar.fromDate(_selectedDay);
    var lunarYearMonth =
        '${lunarDate.getMonthInChinese()}${lunarDate.getDayInChinese()}';
    var yi = lunarDate.getDayYi().join(',');
    var ji = lunarDate.getDayJi().join(',');

    // var jiriList = jieriList(_selectedDay);

    HistoryData? historyTodayEvents;

    if (_showTodayOfHistory) {
      historyTodayEvents = _hts[_selectedDay.month.toString().padLeft(2, '0') +
          _selectedDay.day.toString().padLeft(2, '0')];
    }

    return Scaffold(
        backgroundColor: const Color.fromARGB(0xFF, 0xF8, 0xF8, 0xF8),
        appBar: AppBar(backgroundColor: Colors.blueGrey[300],elevation: 0,
          title: Center(child: const Text('Calendar')),
          leading:  IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pushNamed('/home');
            },
          ),actions: [IconButton(
          icon: Icon(Icons.notifications),
          color: Colors.black,
          onPressed: ()  {

          },
        ),],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Visibility(
                visible: _selectedDay.year != DateTime.now().year ||
                    _selectedDay.month != DateTime.now().month ||
                    _selectedDay.day != DateTime.now().day,
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _selectedDay = DateTime.now();
                      _focusedDay = _selectedDay;
                    });
                  },
                  child: const Text(
                    'Now',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                heroTag: "b1",
                onPressed: () {
                  __addEvensForDay(_selectedDay, 'Janith');
                },
                child: const Icon(Icons.add_box),
              )
            ],
          ),
        ),

        body: ListView(
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TableCalendar<Event>(
                  locale: 'en_US',
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                  ),
                  pageJumpingEnabled: true,
                  daysOfWeekHeight: 25,
                  firstDay: DateTime.utc(1900, 1, 1),
                  lastDay: DateTime.utc(3000, 11, 21),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  eventLoader: _getEventsForDay,
                  selectedDayPredicate: (day) {

                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      // Call `setState()` when updating the selected day
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    }
                  },
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      // Call `setState()` when updating calendar format
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    var day = _selectedDay.day;
                    if (day >
                        SolarUtil.getDaysOfMonth(
                            focusedDay.year, focusedDay.month)) {
                      day = SolarUtil.getDaysOfMonth(
                          focusedDay.year, focusedDay.month);
                    }
                    setState(() {
                      _focusedDay =
                          DateTime(focusedDay.year, focusedDay.month, day);
                      _selectedDay = _focusedDay;
                    });
                  },

                ),
                const SizedBox(height: 8.0),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    child: ValueListenableBuilder<List<Event>>(
                      valueListenable: _selectedEvents,
                      builder: (context, value, _) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: value.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              child: SwipeActionCell(
                                backgroundColor: Colors.white,
                                key: ValueKey(value[index].title),
                                trailingActions: <SwipeAction>[
                                  SwipeAction(
                                    nestedAction:
                                        SwipeNestedAction(title: "Conform"),
                                    title: "Delete",
                                    onTap: (CompletionHandler handler) async {
                                      await handler(true);
                                      _removeEventsForDay(_selectedDay, index,
                                          value[index].title);
                                      setState(() {});
                                    },
                                    color: Colors.red,
                                  ),
                                ],
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 6),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.event_note_outlined),
                                      const SizedBox(width: 8),
                                      Expanded(child: Text('${value[index]}')),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),

                Visibility(
                  visible: historyTodayEvents != null &&
                      historyTodayEvents.events.isNotEmpty,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'today in history',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(width: 5),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: historyTodayEvents?.events.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.event,
                                        color: Colors.blueGrey,
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          historyTodayEvents!.events[index],
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.blueGrey),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ],
        ));
  }
}
