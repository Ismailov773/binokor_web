import 'package:binokor_web/models/Stydy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vertical_tabs_flutter/vertical_tabs.dart';

import '../models/Teachers.dart';
import '../models/uij.dart';

class StudyPage extends StatefulWidget {
  const StudyPage({Key? key}) : super(key: key);

  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _tabStudyController;

  List<Study> _listStudy = [
    Study(
        title: "Монтажник стальных и железобетонных конструкций",
        titledesc: "Описание:",
        desc: [
          "Настоящая программа предназначена для повышения квалификации монтажников по монтажу стальных и железобетонных конструкций на 3 разряд. Срок обучения 1 месяц, что составляет 144 часов, из них на теоретические занятия отводится 48 часов, на производственное обучение и 8 часов на экзамен."
        ],
        work: "Рабочая программа:",
        workdesc: [
          "Теоретическое обучение по процессу монтажа;",
          "Специальный курс;",
          "Оборудование и технология выполнения работ по монтажу стальных и железобетонных конструкций;",
          "Охрана труда (пожарная безопасность и электробезопасность)."
        ],
        practice: "Практическое обучение:",
        practicedesc: [
          "Производственное обучение;",
          "Производственная практика;",
          "Консультации и квалификационный экзамен."
        ]),
    Study(
        title: "Машинист крана (крановщик)",
        titledesc: "Описание:",
        desc: [
          "Данная программа предназначена для подготовки рабочих по профессии «Машинист крана (крановщик)» 2-6 разряда и повышения квалификации рабочих по профессии «машинист крана (крановщик)» 3-6 го разрядов. Общая длительность курса составляет 286 часов."
        ],
        work: "Рабочая программа:",
        workdesc: [
          "Общетехнический курс;",
          "Материаловедение;",
          "Основы электротехники;",
          "Основы слесарного дела;",
          "Охрана труда."
        ],
        practice: "Практическое обучение:",
        practicedesc: [
          "Производственное обучение;",
          "Производственная практика;",
          "Консультации и квалификационный экзамен."
        ]),
    Study(
        title: "Машинист крана (крановщик)",
        titledesc: "Описание:",
        desc: [
          "Образовательный процесс в организации может осуществляться в течение всего календарного года. Продолжительность учебного года определяется организацией. Трудоемкость профессиональной программы составляет – 60 часов, включая все виды учебной практической работы слушателя."
        ],
        work: "Рабочая программа:",
        workdesc: [
          "Основные сведения о грузоподъемных машинах;",
          "Организация работ по безопасной эксплуатации грузоподъемных машин;",
          "Грузозахватные устройства;",
          "Виды и способы строповки грузов;",
          "Охрана труда, электробезопасность и пожарная безопасность."
        ],
        practice: "Практическое обучение:",
        practicedesc: [
          "Первичные навыки обвязки, строповки и отцепки грузов. Освоение подачи сигналов машинисту крана (крановщику);",
          "Приемы строповки грузов. Схемы строповки;",
          "Подготовка груза к перемещению;",
          "Самостоятельное выполнение работ в качестве стропальщика (под руководством крановщика);",
          "Пробная квалификационная работа."
        ]),
    Study(
        title: "Курсы по ОТ и ТБ",
        titledesc: "Описание:",
        desc: [
          "Рабочая программа рассчитана для инженерно-технических работников на 36 часа (и для мастеров и бригадиров 72 часов)."
        ],
        work: "Рабочая программа:",
        workdesc: [
          "Введение;",
          "Законодательные и правовые основы охраны труда;",
          "Производственная санитария и гигиена труда в строительстве;",
          "Основы техники безопасности в строительстве;",
          "Основы электробезопасности;",
          "Основы пожаробезопасности."
        ],
        practice: "",
        practicedesc: []),
    Study(
        title: "Формовщик ЖБИ",
        titledesc: "Описание:",
        desc: [
          "Настоящая программа предназначена для повышения квалификации формовщика железобетонных изделий и конструкций на 3 разряд. Срок обучения 1 месяц, что составляет 144 часов, из них на теоретические занятия отводится 48 часов, на производственное обучение 88 часов и 8 часов на экзамен."
        ],
        work: "Рабочая программа:",
        workdesc: [
          "Теоретическое обучение по профессии;",
          "Материаловедение;",
          "Специальная технология;",
          "Охрана труда (пожарная безопасность и электробезопасность)."
        ],
        practice: "Практическое обучение:",
        practicedesc: [
          "Производственное обучение;",
          "Производственная практика;",
          "Консультации и квалификационный экзамен."
        ]),
    Study(
        title: "Электромонтер по ремонту и обслуживанию электрооборудования",
        titledesc: "Описание:",
        desc: [
          "Программа предназначена для повышения квалификации электромонтера на 3 разряд. Срок обучения 1 месяц, что составляет 144 часов, из них на теоретические занятия отводится 48 часов, на производственное обучение 88 часов и 8 часов на экзамен."
        ],
        work: "Рабочая программа:",
        workdesc: [
          "Теоретическое обучение по профессии;",
          "Основы электромонтажных работ в строительстве;",
          "Охрана труда (пожарная безопасность и электробезопасность).",
        ],
        practice: "Практическое обучение:",
        practicedesc: [
          "Производственное обучение;",
          "Производственная практика;",
          "Консультации и квалификационный экзамен."
        ]),
    Study(
        title: "Электрогазосварщик",
        titledesc: "Описание:",
        desc: [
          "Программа предназначена для повышения квалификации электромонтера на 3 разряд. Срок обучения 1 месяц, что составляет 144 часов, из них на теоретические занятия отводится 48 часов, на производственное обучение 88 часов и 8 часов на экзамен."
        ],
        work: "Рабочая программа:",
        workdesc: [
          "Материаловедение;",
          "Основы черчения;",
          "Основы электротехники;",
          "Технология и оборудование электрогазосварки."
        ],
        practice: "Практическое обучение:",
        practicedesc: [
          "Производственное обучение;",
          "Производственная практика;",
          "Консультации и квалификационный экзамен."
        ]),
    Study(
        title: "Специальность «Бухгалтер». Основы бухгалтерского учета",
        titledesc: "Описание:",
        desc: [
          "Программа курсов предназначена для специалистов хозяйствующих субъектов всех форм собственности и индивидуальных предпринимателей, которые обязаны вести бухгалтерский учет в соответствии с законом Республики Узбекистан «О бухгалтерском учёте». Продолжительность обучения 144 академических часов."
        ],
        work: "Рабочая программа:",
        workdesc: [
          "Содержание и функции бухгалтерского учета;",
          "Учет денежных средств и денежных документов;",
          "Учет расчетов;",
          "Учет основных средств и нематериальных активов;",
          "Учет материально-производственных запасов;",
          "Учет затрат на производство продукции;",
          "Учет выпуска и продажи готовой продукции;",
          "Учет труда, заработной платы и расчетов с персоналом по оплате труда;",
          "Учет фондов, резервов и финансовых результатов;",
          "Бухгалтерская отчетность;",
          "Итоговая аттестация;",
          "Экзамен и/или защита итоговой работы.",
        ],
        practice: "",
        practicedesc: []),
  ];
  List<Teachers> _listTeachers = [
    Teachers(
        name: "Абдусаламов Абдувасик Боисович",
        post: "Член комиссии по повышению квалификации Министерства Труда",
        imagepath: "assets/images/teachers/specialist-1.webp"),
    Teachers(
        name: "Эрматов Зиядулла Досматович",
        post: "Доцент кафедры «Технологические машины и оборудование» ТАСИ",
        imagepath: "assets/images/teachers/specialist-3.webp"),
    Teachers(
        name: "Юсупов Усмонжон Тургуналиевич",
        post: "Доцент кафедры «Здания и сооружения» ТАСИ",
        imagepath: "assets/images/teachers/specialist-3.webp"),
    Teachers(
        name: "Хабибуллаев Шавкат Азаматович",
        post: "Доцент кафедры «Технология и организация строительства» ТАСИ",
        imagepath: "assets/images/teachers/specialist-4.webp"),
    Teachers(
        name: "Базарбаев Алишер Инамджанович",
        post: "Главный инспектор территориального управления города Ташкента",
        imagepath: "assets/images/teachers/specialist-5.webp"),
    Teachers(
        name: "Мирсаидов Муракам Мирзахматович",
        post:
            "Старший преподаватель кафедры «Электротехники, электромеханики и электротехнологии» ТГТУ",
        imagepath: "assets/images/teachers/specialist-6.webp"),
  ];
  List<String> _listSertificate = [
    "assets/images/sertificate/1.png",
    "assets/images/sertificate/2.png",
    "assets/images/sertificate/3.png",
    "assets/images/sertificate/4.png",
    "assets/images/sertificate/5.png",
    "assets/images/sertificate/6.png"
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabStudyController = TabController(length: _listStudy.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width > UiJ.widthSize ? 50 : 10,
            right: MediaQuery.of(context).size.width > UiJ.widthSize ? 50 : 10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              alignment: Alignment.topLeft,
              child: Text("Обучение",
                  style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width > UiJ.widthSize
                              ? 30
                              : 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: UiJ.fontbold)),
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Container(
                child: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.amber,
                    //isScrollable: true,
                    labelStyle: TextStyle(
                        fontSize:
                            MediaQuery.of(context).size.width > UiJ.widthSize
                                ? 30
                                : 15,
                        fontFamily: UiJ.font),
                    labelColor: Colors.black,
                    tabs: [
                  Tab(
                    text: "Учебные курсы",
                  ),
                  Tab(
                    text: "Преподаватели",
                  ),
                  Tab(
                    text: "Сертификаты",
                  )
                ])),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: [courses(), teachers(), sertificate()],
            )),
          ],
        ));
  }

  Widget courses() {
    return Container(
        child: Row(
      children: [
        Expanded(
            child: Column(
          children: [
            Expanded(
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: VerticalTabs(
                        indicatorColor: Colors.white,
                        backgroundColor: Colors.white,
                        tabBackgroundColor: Colors.white,
                        tabsWidth: MediaQuery.of(context).size.width / 4,
                        tabs: _listStudy
                            .map((e) => Tab(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                      Container(
                                        height: 80,
                                          width: MediaQuery.of(context).size.width,
                                          child: Card(
                                          child: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Container(
                                                  child: Text(e.title!,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width >
                                                                  UiJ.widthSize
                                                              ? 20
                                                              : 15,
                                                          fontFamily:
                                                              UiJ.fontbold)))))),
                                      // Divider()
                                    ])))
                            .toList(),
                        contents: _listStudy.map((e) {
                          return Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      e.titledesc!,
                                      style: TextStyle(
                                          fontFamily: UiJ.fontbold,
                                          fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width >
                                                  UiJ.widthSize
                                              ? 20
                                              : 15),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      // height: 200,
                                      child: Column(
                                          children: e.desc!.map((e) {
                                    return Text(
                                      e,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width >
                                                  UiJ.widthSize
                                              ? 20
                                              : 15,
                                          fontFamily: UiJ.font),
                                    );
                                  }).toList())),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child: Text(
                                      e.work!,
                                      style: TextStyle(
                                          fontFamily: UiJ.fontbold,
                                          fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width >
                                                  UiJ.widthSize
                                              ? 20
                                              : 15),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      child: Column(
                                    children: e.workdesc!.map((e) {
                                      return RichText(
                                          text: TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(
                                          Icons.circle,
                                          size: 15,
                                        )),
                                        WidgetSpan(
                                            child: SizedBox(
                                          width: 20,
                                        )),
                                        TextSpan(
                                          text: e,
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width >
                                                      UiJ.widthSize
                                                  ? 20
                                                  : 15,
                                              fontFamily: UiJ.font),
                                        )
                                      ]));
                                    }).toList(),
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child: Text(
                                      e.practice!,
                                      style: TextStyle(
                                          fontFamily: UiJ.fontbold,
                                          fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width >
                                                  UiJ.widthSize
                                              ? 20
                                              : 15),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      child: Column(
                                    children: e.practicedesc!.map((e) {
                                      return RichText(
                                          text: TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(
                                          Icons.circle,
                                          size: 15,
                                        )),
                                        WidgetSpan(
                                            child: SizedBox(
                                          width: 20,
                                        )),
                                        TextSpan(
                                          text: e,
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width >
                                                      UiJ.widthSize
                                                  ? 20
                                                  : 15,
                                              fontFamily: UiJ.font),
                                        )
                                      ]));
                                    }).toList(),
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  )),
                                ],
                              ));
                        }).toList()))),
          ],
        )),
      ],
    ));
  }

  Widget teachers() {
    return Padding(
        padding: EdgeInsets.all(20),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).size.width > UiJ.widthSize ? 3 : 1),
            itemCount: _listTeachers.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.height / 5,
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset(
                              _listTeachers[index].imagepath,
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.height / 4,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Text(
                              _listTeachers[index].name,
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width >
                                        UiJ.widthSize
                                    ? 25
                                    : 15,
                                fontFamily: UiJ.font,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              _listTeachers[index].post,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width >
                                        UiJ.widthSize
                                    ? 20
                                    : 15,
                                fontFamily: UiJ.fontbold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ));
            }));
  }

  Widget sertificate() {
    return GridView.builder(
        itemCount: _listSertificate.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                MediaQuery.of(context).size.width > UiJ.widthSize ? 3 : 1),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Image.asset(_listSertificate[index]),
          );
        });
  }
}
