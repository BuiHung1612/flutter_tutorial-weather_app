import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double cardHeight = 0;
  @override
  Widget build(BuildContext context) {
    Widget getWeatherIcon(int code) {
      switch (code) {
        case >= 200 && < 300:
          return Image.asset(
            'assets/1.png',
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.4,
          );
        case >= 300 && < 400:
          return Image.asset(
            'assets/2.png',
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.4,
          );
        case >= 500 && < 600:
          return Image.asset(
            'assets/3.png',
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.4,
          );
        case >= 600 && < 700:
          return Image.asset(
            'assets/4.png',
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.4,
          );
        case >= 700 && < 800:
          return Image.asset(
            'assets/5.png',
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.4,
          );
        case == 800:
          return Image.asset(
            'assets/6.png',
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.4,
          );
        case > 800 && <= 804:
          return Image.asset(
            'assets/7.png',
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.4,
          );
        default:
          return Image.asset(
            'assets/7.png',
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.4,
          );
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: Colors.transparent),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 1.2 * kToolbarHeight, 20, 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(children: [
              Align(
                alignment: const AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 260,
                  width: 280,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepPurple),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 260,
                  width: 280,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepPurple),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 220,
                  width: 600,
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle, color: Color(0xFFFFAB40)),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent)),
              ),
              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                builder: (context, state) {
                  if (state is WeatherBlocSuccess) {
                    final currentHour = DateTime.now().hour;
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() => cardHeight = 500);
                            },
                            child: Text(
                              '📍 ${state.weather.areaName} ',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            currentHour < 12
                                ? 'Chào buổi sáng'
                                : currentHour < 17
                                    ? 'Chào buổi chiều'
                                    : 'Chào buổi tối',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Center(
                            child: getWeatherIcon(
                                state.weather.weatherConditionCode!),
                          ),
                          Center(
                            child: Text(
                              '${state.weather.temperature!.celsius!.round()}°C',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Center(
                            child: Text(
                              state.weather.weatherDescription!.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Text(
                              DateFormat('EEEE dd •')
                                  .add_jm()
                                  .format(state.weather.date!),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/11.png',
                                      scale: 8,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Sunrine',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          DateFormat()
                                              .add_jm()
                                              .format(state.weather.sunrise!),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/12.png',
                                      scale: 8,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Sunset',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          DateFormat()
                                              .add_jm()
                                              .format(state.weather.sunset!),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/13.png',
                                      scale: 8,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Temp Max',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          '${state.weather.tempMax!.celsius!.round()}°C',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/14.png',
                                      scale: 8,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Temp Min',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          '${state.weather.tempMin!.celsius!.round()}°C',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  } else if (state is WeatherBlocLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return const Center(
                      child: Text('Fetch weather failed'),
                    );
                  }
                },
              ),
              AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  transformAlignment: Alignment.bottomRight,
                  height: cardHeight,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(top: 24),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Danh sách tỉnh thành",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  cardHeight = 0;
                                });
                              },
                              child: const Icon(Icons.close),
                            )
                          ],
                        ),
                      ),
                    ],
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
