import 'package:flutter/material.dart';

class PageModel {
  String _titles;

  String _description;
  IconData _icons;

  String _images;

  PageModel(this._titles, this._description, this._icons, this._images);

  String get images => _images;

  IconData get icons => _icons;

  String get description => _description;

  String get titles => _titles;


}