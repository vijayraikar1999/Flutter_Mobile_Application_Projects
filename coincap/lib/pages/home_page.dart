import 'dart:convert';

import 'package:coincap/pages/details_page.dart';
import 'package:coincap/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _deviceHeight, _deviceWidth;

  HTTPService? _http;

  String _coinCurrnecy = 'bitcoin';

  @override
  void initState() {
    super.initState();
    _http = GetIt.instance.get<HTTPService>();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _selectedCoinDropdown(),
              _dataWidgets(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectedCoinDropdown() {
    List<String> _coins = [
      'bitcoin',
      'ethereum',
      'tether',
      'cardano',
      'ripple',
    ];
    List<DropdownMenuItem<String>> _items = _coins
        .map(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(
              e,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
        .toList();
    return DropdownButton(
      value: _coinCurrnecy,
      items: _items,
      onChanged: (_value) {
        setState(() {
          _coinCurrnecy = _value.toString();
        });
      },
      dropdownColor: const Color.fromRGBO(83, 88, 206, 1.0),
      iconSize: 30.0,
      icon: const Icon(
        Icons.arrow_drop_down_sharp,
        color: Colors.white,
      ),
      underline: Container(),
    );
  }

  Widget _dataWidgets() {
    return FutureBuilder(
      future: _http!.get('/coins/$_coinCurrnecy'),
      builder: (_context, _snapshot) {
        if (_snapshot.hasData) {
          Map _data = jsonDecode(_snapshot.data.toString());

          num _usdPrice = _data['market_data']['current_price']['usd'];
          num _change24h = _data['market_data']['price_change_percentage_24h'];
          Map _exchangeRates = _data['market_data']['current_price'];
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_context) => DetailsPage(rates: _exchangeRates),
                  ),
                ),
                child: _coinImageWidget(
                  _data['image']['large'],
                ),
              ),
              _currentPriceWidget(_usdPrice),
              _percentageChangeWidget(_change24h),
              _descriptionCardWidget(_data['description']['en']),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
      },
    );
  }

  Widget _currentPriceWidget(num _rate) {
    return Text(
      '${_rate.toStringAsFixed(2)} USd',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 30.0,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _percentageChangeWidget(num _change) {
    return Text(
      '${_change.toString()} %',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15.0,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _coinImageWidget(String _imgURL) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: _deviceHeight! * 0.02),
      height: _deviceHeight! * 0.15,
      width: _deviceWidth! * 0.15,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(_imgURL),
        ),
      ),
    );
  }

  Widget _descriptionCardWidget(String _description) {
    return Container(
      height: _deviceHeight! * 0.45,
      width: _deviceWidth! * 0.90,
      margin: EdgeInsets.symmetric(vertical: _deviceHeight! * 0.05),
      padding: EdgeInsets.symmetric(
          vertical: _deviceHeight! * 0.01, horizontal: _deviceHeight! * 0.01),
      // color: Colors.teal,
      color: const Color.fromRGBO(83, 88, 206, 0.5),
      child: Text(
        _description,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
