export class WetherResponseModel {
  code: number;
  result: WetherResultModel;
  msg: string;
}

export class WetherResultModel {
  alert: string;
  aqi: number;
  city_name: string;
  current_condition: string;
  current_temperature: number;
  current_time: number;
  dat_condition: string;
  dat_high_temperature: number;
  dat_low_temperature: number;
  dat_weather_icon_id: string;
  download_icon: number;
  day_condition: string;
  high_temperature: number;
  forecast_list: WetherDayModel[];
  hourly_forecast: WetherHourModel[];

  low_temperature: number;
  night_condition: string;
  moji_city_id: number;
  origin_data: object;

  tomorrow_aqi: number;
  quality_level: string;
  tomorrow_high_temperature: number;
  tips: string;
  tomorrow_low_temperature: number;
  tomorrow_condition: string;
  wind_level: number;
  tomorrow_quality_level: string;
  tomorrow_weather_icon_id: string;
  update_time: string;
  weather_icon_id: string;
  wind_direction: string;

}

export class WetherDayModel {
  condition: string;
  date: string;
  high_temperature: string;
  low_temperature: string;
  weather_icon_id: string;
  wind_direction: string;
  wind_level: string;
}

export class WetherHourModel {
  condition: string;
  hour: string;
  temperature: string;
  weather_icon_id: string;
  wind_direction: string;
  wind_level: string;
}