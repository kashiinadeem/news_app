import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/News/data/models/article_model.dart';
import 'package:news_app/features/News/data/models/source_model.dart';

class SelectedCountry extends Bloc<SourceModel?, SourceModel?> {
  SelectedCountry() : super(null) {
    on<SourceModel>((event, emit) => emit(event));
  }
}
