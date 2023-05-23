import 'package:flutter/cupertino.dart';

import '../../../../../core/navigator/navigator.dart';
import '../../../../../core/petlovers_core.dart';
import 'sample_address_data.dart';

class PickAddressPage extends StatefulWidget {
  const PickAddressPage({super.key});

  @override
  State<PickAddressPage> createState() => _PickAddressPageState();
}

enum PickAddressType {
  province,
  city,
  district,
  postalCode,
  information;
}

class _PickAddressPageState extends State<PickAddressPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  final label = ['Rumah', 'Kantor'];
  List data = [];

  String? province, city, district, postalCode;
  PickAddressType pickAddressType = PickAddressType.province;

  @override
  void initState() {
    final province = provinceData.toList();
    data.addAll(province.toList());

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = Tween(
      begin: 0.toDouble(),
      end: 1.toDouble(),
    ).animate(controller);
    controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onAddProvince(String provinceId) {
    final city = cityData.where((e) => e['province_id'] == provinceId).toList();
    setState(() {
      data = city;
      pickAddressType = PickAddressType.city;
    });

    controller.reset();
    controller.forward();
  }

  void onAddCity(String cityId) {
    final district =
        districtData.where((e) => e['regency_id'] == cityId).toList();
    setState(() {
      data = district;
      pickAddressType = PickAddressType.district;
    });

    controller.reset();
    controller.forward();
  }

  void onAddDistrict(String districtId) {
    setState(() {
      data = [
        {"name": '16800'},
        {"name": '16801'},
        {"name": '16802'},
        {"name": '16803'},
        {"name": '16804'},
        {"name": '16805'},
      ];
      pickAddressType = PickAddressType.postalCode;
    });

    controller.reset();
    controller.forward();
  }

  void onAddPostalCode() {
    setState(() {
      pickAddressType = PickAddressType.information;
    });

    controller.reset();
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = getTextTheme(context);

    return PetLoversScaffold(
      backgroundColor: pickAddressType == PickAddressType.information
          ? PLThemeConstant.lightPrimary
          : Colors.white,
      title: "Tambah Alamat",
      bottomFloating: pickAddressType != PickAddressType.information
          ? null
          : Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
                top: 10,
                bottom: 30,
              ),
              width: getSize(context).width,
              child: ElevatedButton(
                onPressed: () {
                  pop(context: context);
                },
                child: const Text("Simpan"),
              ),
            ),
      body: Container(
        width: getSize(context).width,
        height: getSize(context).height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (pickAddressType == PickAddressType.information) ...{
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tandai Sebagai",
                                style: textTheme.bodyMedium,
                              ),
                              Wrap(
                                children: [
                                  ...label.map(
                                    (e) => Container(
                                      margin: const EdgeInsets.only(
                                          right: 10, bottom: 10),
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: PLThemeConstant.lightPrimary,
                                        borderRadius: BorderRadius.circular(5),
                                        border: e == 'Rumah'
                                            ? Border.all(
                                                width: 0.5,
                                                color: PLThemeConstant
                                                    .pinkSecondary,
                                              )
                                            : null,
                                      ),
                                      child: Wrap(
                                        children: [
                                          Text(
                                            e,
                                            style:
                                                textTheme.bodySmall?.copyWith(
                                              color: e == 'Rumah'
                                                  ? PLThemeConstant
                                                      .pinkSecondary
                                                  : null,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Atur sebagai alamat utama",
                                style: textTheme.bodyMedium,
                              ),
                              CupertinoSwitch(
                                value: true,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  separator,
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 10, bottom: 5),
                    child: Text("Detail Alamat"),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Dramaga, Bogor, Jawa Barat, Indonesia",
                                style: textTheme.bodyMedium,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                        const Divider(),
                        TextFormField(
                          maxLines: 3,
                          decoration: const InputDecoration(
                            hintText: "Detail Lainnya (Cth: No.Rumah, Patokan)",
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                  separator,
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 10, bottom: 5),
                    child: Text("Kontak penerima"),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Nama penerima",
                          ),
                        ),
                        const Divider(),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Nomor telepon",
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                ],
              )
            },
            if (pickAddressType != PickAddressType.information) ...{
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Text(
                  "Dramaga, Bogor, Jawa Barat, Indonesia",
                  style: textTheme.displayMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final data = this.data[index];
                    return AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        return Opacity(
                          opacity: animation.value,
                          child: InkWell(
                            onTap: () {
                              if (pickAddressType == PickAddressType.province) {
                                onAddProvince(data['id']);
                                return;
                              }

                              if (pickAddressType == PickAddressType.city) {
                                onAddCity(data['id']);
                                return;
                              }

                              if (pickAddressType == PickAddressType.district) {
                                onAddDistrict(data['id']);
                                return;
                              }

                              if (pickAddressType ==
                                  PickAddressType.postalCode) {
                                onAddPostalCode();
                                return;
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              child: Text(
                                data['name'],
                                style: textTheme.bodyMedium,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            }
          ],
        ),
      ),
      // bottomFloating: Container(
      //   color: Colors.white,
      //   padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
      //     top: 10,
      //     bottom: 30,
      //   ),
      //   width: getSize(context).width,
      //   child: ElevatedButton(
      //     onPressed: () {
      //       pop(context: context);
      //     },
      //     child: const Text("Tambah"),
      //   ),
      // ),
    );
  }
}
