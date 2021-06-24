/// ---------------------------------------------------
import 'package:flutter/material.dart';

/// ---------------------------------------------------
class InfoAboutRsaView extends StatelessWidget {
  static final String routeName = '/InfoView';

  final TextStyle textStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  final List<String> list = <String>[
    'RSA Algoritmasinin anahtar olusturma sureci bes adimdan olusmaktadir:',
    '1) p ve q olacak sekilde iki adet büyük asal sayi secilir.',
    '2) n = p * q olacak sekilde, daha sonra acik ve kapali anahtarlarimiz tarafindan kullanilacak olan n sayisi hesaplanir.',
    '3) ϕ(n) = (p - 1) * (q - 1) olacak sekilde, Totient fonksiyonu hesaplanir.',
    '4) 1 < e < ϕ(n) olacak sekilde, gcd⁡(e, ϕ(n)) = 1 kosulunu saglayan bir e tam sayisi secilir.',
    '5) d = (e ^ -1) mod ϕ(n) yani d * e = 1 mod ϕ(n) olacak sekilde, d tamsayisi hesaplanir.',
    'Yukaridaki adimlarin tamamlanmasi halinde, surecin ilerleyen kisimlarinda sifreleme ve sifre cozme islemlerinde kullanilan iki adet asimetrik anahtar yani Acik Anahtar = { n, e } ve Kapali Anahtar = { n, d } olusturulmus olur.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RSA ALGORITHM'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12.0),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                '${list[index]}',
                style: textStyle,
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
