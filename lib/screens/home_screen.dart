import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TimeOfDay time = const TimeOfDay(hour: 10, minute: 30);
  DateTime date = DateTime(2023, 1, 1, 10, 30);
  DateTime finaldate = DateTime(2023, 1, 1, 10, 30);

  @override
  Widget build(BuildContext context) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          title: const Text(
            "올리버와 데이빗",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/images/maxresdefault.jpg',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "원하는 기상시간 / 날짜",
                style: TextStyle(
                    color: Colors.green.shade300,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 10),
              //         child: TextField(
              //           decoration: InputDecoration(
              //               border: const OutlineInputBorder(),
              //               hintText: '$hours시$minutes분'),
              //         ),
              //       ),
              //     ),
              //     ElevatedButton(
              //       onPressed: () async {
              //         TimeOfDay? newTime = await showTimePicker(
              //             context: context, initialTime: time);
              //         if (newTime == null) {
              //           return;
              //         } else {
              //           setState(() {
              //             time = newTime;
              //           });
              //         }
              //       },
              //       style:
              //           ElevatedButton.styleFrom(fixedSize: const Size(50, 62)),
              //       child: Icon(
              //         Icons.alarm_add,
              //         color: Colors.green.shade100,
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.green,
                                width: 2,
                              ),
                            ),
                            hintText:
                                '${date.year}년${date.month}월${date.day}일${date.hour}시${date.minute}분'),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      DateTime? newDate = await DatePicker.showDateTimePicker(
                          context,
                          showTitleActions: true,
                          minTime: DateTime(2023, 1, 1, 10, 30),
                          maxTime: DateTime(2055, 1, 1, 10, 30),
                          onConfirm: (finaldate) {
                        print('confirm $finaldate');
                      }, locale: LocaleType.ko);

                      if (newDate == null) {
                        return;
                      } else {
                        setState(() {
                          date = newDate;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        width: 2,
                        color: Colors.green,
                      ),
                      fixedSize: const Size(
                        50,
                        62,
                      ),
                      backgroundColor: Colors.white,
                    ),
                    child: const Icon(
                      Icons.calendar_month,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 10),
              //         child: TextField(
              //           decoration: InputDecoration(
              //               border: const OutlineInputBorder(),
              //               hintText: '${date.year}.${date.month}.${date.day}.'),
              //         ),
              //       ),
              //     ),
              //     ElevatedButton(
              //       onPressed: () async {
              //         DateTime? newDate = await showDatePicker(
              //             context: context,
              //             initialDate: date,
              //             firstDate: DateTime(2022),
              //             lastDate: DateTime(2050));

              //         if (newDate == null) return;
              //         setState(() {
              //           date = newDate;
              //         });
              //       },
              //       style:
              //           ElevatedButton.styleFrom(fixedSize: const Size(50, 62)),
              //       child: Icon(
              //         Icons.calendar_month,
              //         color: Colors.green.shade100,
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  finaldate = date.subtract(const Duration(hours: 16));
                  setState(() {
                    finaldate = finaldate;
                  });
                },
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(
                    width: 2,
                    color: Colors.green,
                  ),
                  fixedSize: const Size(
                    200,
                    62,
                  ),
                  backgroundColor: Colors.white,
                ),
                child: const Icon(
                  Icons.calculate,
                  size: 50,
                  color: Colors.green,
                ),
              ),
              const SizedBox(
                height: 40,
              ),

              Text(
                DateFormat("yyyy년 MM월 dd일 HH시 MM분").format(finaldate),
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                "에 마지막 식사를 하세요, \n 물을 마시거나 취침 등 일상생활은 상관없습니다.\n 그리고 원하는 기상 시간에 식사를 하세요",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
