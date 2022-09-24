import 'package:flutter/material.dart';
import 'package:odc_bootcamp/model/lecture_model/lecture_model.dart';

import '../../../model/exam_mode/exam_model.dart';
import '../../../model/section_model/section_model.dart';

Widget buildCardItem({
  required String title,
  required String duration,
  required String day,
  required String startTime,
  required String endTime,
}) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 25),
              ),
              Row(
                children: [
                  const Icon(Icons.punch_clock_sharp),
                  Text('$duration hrs'),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'section Day',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month_outlined),
                      Text(day),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'start time',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.timer_outlined,
                        color: Colors.green,
                      ),
                      Text(startTime)
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'End time',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.timer_outlined,
                        color: Colors.pink,
                      ),
                      Text(endTime)
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget buildCustomCardLectureItem({required LectureData lectureData}) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                lectureData.lectureSubject.toString(),
                style: const TextStyle(fontSize: 25),
              ),
              Row(
                children: const [
                  Icon(Icons.timer),
                  Text(' 2 hrs'),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Lecture Day',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month_outlined),
                      Text(lectureData.lectureDate.toString()),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Start Time',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_filled,
                        color: Colors.green,
                      ),
                      Text('${lectureData.lectureStartTime!.substring(0, 5)}pm')
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'End Time',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_filled,
                        color: Colors.pinkAccent,
                      ),
                      Text(lectureData.lectureEndTime!.substring(0, 5))
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget buildCustomCardSectionItem({required SectionData sectionData}) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionData.sectionSubject.toString(),
                style: const TextStyle(fontSize: 25),
              ),
              Row(
                children: const [
                  Icon(Icons.timer),
                  Text(' 2 hrs'),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Section Day',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month_outlined),
                      Text(sectionData.sectionDate.toString()),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Start time',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_filled,
                        color: Colors.green,
                      ),
                      Text(sectionData.sectionStartTime!.substring(0,5).toString())
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'End time',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_filled,
                        color: Colors.pinkAccent,
                      ),
                      Text(sectionData.sectionEndTime!.substring(0,5).toString())
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}
Widget buildCustomCardExamItem({required ExamData examData}) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                examData.examSubject.toString(),
                style: const TextStyle(fontSize: 25),
              ),
              Row(
                children: const [
                  Icon(Icons.timer),
                  Text(' 2 hrs'),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Exam Day',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month_outlined),
                      Text(examData.examDate.toString()),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Start time',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_filled,
                        color: Colors.green,
                      ),
                      Text(examData.examStartTime!.substring(0,5).toString())
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'End time',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_filled,
                        color: Colors.pinkAccent,
                      ),
                      Text(examData.examEndTime!.substring(0,5).toString())
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}
