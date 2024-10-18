import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:trybloc/bloc/weatherbloc_bloc.dart';
import 'package:weather/weather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        ),
        body: FutureBuilder(
          future: _determinePosition(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return BlocProvider<WeatherBlocBloc>(
                create: (context) => WeatherBlocBloc()..add(FetchWeatherEvt(position: snapshot.data as Position)),
                child: BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                  builder: (context, state) {
                    Weather? weather;
                    if (state is WeatherBlocSuccess) {
                      weather = state.weather;
                    }

                    return Padding(
                      padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Stack(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(4, -0.3),
                              child: Container(
                                width: 300,
                                height: 300,
                                decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.deepPurple),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-4, -0.3),
                              child: Container(
                                width: 300,
                                height: 300,
                                decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.deepPurple),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0, -1.2),
                              child: Container(
                                width: 600,
                                height: 300,
                                decoration: const BoxDecoration(color: Color(0XFFfea33f)),
                              ),
                            ),
                            BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 100,
                                sigmaY: 100,
                              ),
                              child: Container(
                                color: Colors.transparent,
                              ),
                            ),
                            if (state is WeatherBlocSuccess)
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '📍 ${weather!.areaName}',
                                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                                    ),
                                    const Text(
                                      'Bonjour',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
                                    ),
                                    Center(
                                        child: Image.asset(
                                      'assets/3.png',
                                      height: 300,
                                    )),
                                    const SizedBox(height: 30),
                                    Center(
                                      child: Text(
                                        '~ ${weather.temperature.toString().toLowerCase().replaceAll('celsius', '')}℃',
                                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 50),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        '${weather.tempFeelsLike.toString().toLowerCase().replaceAll('celsius', '')}℃',
                                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 40),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        '${weather.weatherDescription}',
                                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 25),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        DateFormat('EEEE dd MMMM yyyy •').add_Hm().format(weather.date!),
                                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 16),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/1.png',
                                              scale: 5,
                                            ),
                                            const SizedBox(width: 5),
                                            const Column(
                                              children: [
                                                Text(
                                                  'Sunrise',
                                                  style: TextStyle(fontWeight: FontWeight.w100, color: Colors.white),
                                                ),
                                                Text(
                                                  '5:34 am',
                                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/8.1.png',
                                              scale: 5,
                                            ),
                                            const SizedBox(width: 5),
                                            const Column(
                                              children: [
                                                Text(
                                                  'Sunset',
                                                  style: TextStyle(fontWeight: FontWeight.w100, color: Colors.white),
                                                ),
                                                Text(
                                                  '5:34 am',
                                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 5),
                                      child: Divider(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/9.png',
                                              scale: 5,
                                            ),
                                            const SizedBox(width: 5),
                                            const Column(
                                              children: [
                                                Text(
                                                  'Sunrise',
                                                  style: TextStyle(fontWeight: FontWeight.w100, color: Colors.white),
                                                ),
                                                Text(
                                                  '5:34 am',
                                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/12.png',
                                              scale: 5,
                                            ),
                                            const SizedBox(width: 5),
                                            const Column(
                                              children: [
                                                Text(
                                                  'Sunset',
                                                  style: TextStyle(fontWeight: FontWeight.w100, color: Colors.white),
                                                ),
                                                Text(
                                                  '5:34 am',
                                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            else
                              const Center(
                                child: CircularProgressIndicator(),
                              )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
