part of 'banner_bloc.dart';

abstract class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object> get props => [];
}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {}

class BannerSuccess extends BannerState {
  final ResponseBanner responseBanner;
  const BannerSuccess(this.responseBanner);
}

class BannerFailure extends BannerState {}
