import systemDateTime from '@ohos.systemDateTime'
import i18n from '@ohos.i18n'
import { CustomNavigationBar } from '../../../common/CustomNavigationBar/CustomNavigationBar'
import { HttpUtils } from '../../../Utils/Http/HttpUtils'
import Logger from '../../../Utils/Logger/Logger'
import { WetherDayModel, WetherHourModel, WetherResponseModel, WetherResultModel } from './WetherModel'

@Entry
@Component
export struct WetherPage {

  @State wetherResModel: WetherResultModel = null

  @State rotateAngle: number = 0

  private isNeedRefresh: boolean = true

  aboutToAppear(){

    this.loadWetherData()

  }

  loadWetherData() {

    this.getDateWith('')

    let url = 'https://api.oioweb.cn/api/weather/weather'
    HttpUtils.GET(url, {
      'city_name': '昆山市'
    }, (err, response, result) => {
      this.isNeedRefresh = true
      let res: WetherResponseModel = JSON.parse(result)
      this.wetherResModel = res.result
    })
  }

  @Builder refreshButton(): void {
    Image($r('app.media.tianq_shuaxin'))
      .width(36)
      .height(36)
      .padding(10)
      .margin({right: 10.0})
      .rotate({ angle: this.rotateAngle })
      .animation({
        duration: 1200,
        curve: Curve.Friction,
        delay: 500,
        iterations: -1, // 设置-1表示动画无限循环
        playMode: PlayMode.Alternate
      })
      .onClick(() => {
        if (!this.isNeedRefresh) {
          return
        }
        this.isNeedRefresh = false
        this.rotateAngle = 90
        Logger.info('+++= rotateAngle')
        this.loadWetherData()
      })
  }

  build(){
    Column(){

      CustomNavigationBar({
        title: '昆山',
        titleColor: Color.White,
        // showBack: true,
        navBarColor: '#FF384A66',
        leadingBuildParam: null,
        centerBuildParam: null,
        trailingBuildParam: this.refreshButton
      })

      Scroll(){
        Column(){

          if (this.wetherResModel != null) {

            this.topUI()

            this.hourWetherList()

            this.dayWetherList()

            // Row().height(100)
          }

        }
        .width('100%')

        // .backgroundColor(Color.Pink)
      }
      .edgeEffect(EdgeEffect.Spring)
      .layoutWeight(1)
      // .backgroundColor(Color.Yellow)


    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.color_pageBackground'))
  }

  getWindName(code: string){
    let codeArr = code.split('')
    let reversCodeArr = codeArr.reverse()
    let name = ''
    reversCodeArr.forEach(str => {

      if (str == 'E') {
        name += '东'
      }else if (str == 'W') {
        name += '西'
      }else if (str == 'S') {
        name += '南'
      }else if (str == 'N') {
        name += '北'
      }

    });

    return name + '风'
  }

  getWindLeveName(level: string): string {
    let num = parseFloat(level)
    let name = ''
    if (num < 1) {
      name = '无风'
    }else if (num < 5) {
      name = '软风'
    }else if (num < 11) {
      name = '轻风'
    }else if (num < 19) {
      name = '微风'
    }else if (num < 28) {
      name = '和风'
    }else if (num < 38) {
      name = '劲风'
    }else if (num < 49) {
      name = '强风'
    }else if (num < 61) {
      name = '疾风'
    }else if (num < 74) {
      name = '大风'
    }else if (num < 88) {
      name = '烈风'
    }else if (num < 102) {
      name = '狂风'
    }else if (num < 117) {
      name = '暴风'
    }else if (num < 133) {
      name = '飓风'
    }
    return name
  }

  getConditionIcon(condition: string) {
    if (condition.includes('小雨')) {
      return $r('app.media.tianqi_xiaoyu')
    }else if (condition.includes('中雨')) {
      return $r('app.media.tianqi_zhongyu')
    }else if (condition.includes('大雨')) {
      return $r('app.media.tianqi_dayu')
    }else if (condition.includes('小雪')) {
      return $r('app.media.tianqi_xiaoxue')
    }else if (condition.includes('中雪')) {
      return $r('app.media.tianqi_zhongxue')
    }else if (condition.includes('大雪')) {
      return $r('app.media.tianqi_daxue')
    }else if (condition.includes('雷阵雨')) {
      return $r('app.media.tianqi_leizhenyu')
    }else if (condition.includes('阵雨')) {
      return $r('app.media.tianqi_zhenyu')
    }else if (condition == '阴') {
      return $r('app.media.tianqi_yintian')
    }else if (condition == '晴') {
      return $r('app.media.tianqi_qing')
    }else if (condition.includes('多云') && condition.includes('雨') ) {
      return $r('app.media.tianqi_xiaoyu')
    }else {
      return $r('app.media.tianqi_duoyun')
    }
  }

  getDateWith(dateStr: string) {
    let date = new Date('2024-05-11')

    // let dateTimeFormat = new Intl.DateTimeFormat("zh-CN", {dateStyle: "full", timeStyle: "full"});
    // dateTimeFormat.format(date)
    // let options = dateTimeFormat.resolvedOptions()

    // let calendar = i18n.getCalendar("zh-Hans");
    // calendar.setTimeZone("Asia/Shanghai");
    // calendar.set(2024, 5, 11, 8, 0, 0); // set time to 2021.10.1 08:00:00
    // let hourOfDay = calendar.get("day_of_week_in_month"); // hourOfDay = 8



    // Logger.info('+++++ 日期 opthion', JSON.stringify(dateTimeFormat))



  }

  @Builder topUI() {

    Column(){
      // Row(){}.width('100%').height(50).backgroundColor(Color.Gray)

      Row(){
        Text(this.wetherResModel.current_temperature.toString()).fontColor(Color.White).fontSize(62).fontWeight(FontWeight.Medium)
        Column(){
          Text('℃').fontColor($r('app.color.color_B1B8C1')).fontSize(16)
          Text('体感19℃').fontColor($r('app.color.color_B1B8C1')).fontSize(8).maxLines(2)
        }
        .width(30)
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      // .backgroundColor(Color.Blue)


      Text(this.wetherResModel.current_condition + '  ' + this.wetherResModel.low_temperature + '~' + this.wetherResModel.high_temperature + '℃')
        .fontColor(Color.White).fontSize(16).fontWeight(FontWeight.Medium).padding(5)
      Text(this.wetherResModel.tips).fontColor(Color.White).fontSize(13)
    }
    .width('100%')
    .padding(10)
    .backgroundColor('#FF384A66')

  }

  @Builder hourWetherList() {
    Column(){
      List({space: 3.0}){
        ForEach(this.wetherResModel.hourly_forecast, (item: WetherHourModel, index) => {
          ListItem(){
            Column(){
              Text(item.temperature+'℃').textAlign(TextAlign.Center).fontSize(index==0?16.0:12.0).height(30.0)
              // Text(item.condition).textAlign(TextAlign.Center).fontSize(index==0?16.0:12.0).height(30.0)
              Image(this.getConditionIcon(item.condition)).width(20).objectFit(ImageFit.Contain)
              Text(this.getWindName(item.wind_direction)).textAlign(TextAlign.Center).fontSize(10.0).height(30.0)
              Text(this.getWindLeveName(item.wind_level)).textAlign(TextAlign.Center).fontSize(8.0).height(30.0)
              Text(index==0?'现在':item.hour+'时').textAlign(TextAlign.Center).fontSize(index==0?16.0:12.0).height(30.0)
            }
            .justifyContent(FlexAlign.SpaceBetween)
            .padding(15.0)
            // .backgroundColor(Color.Pink)
          }

        }, item => JSON.stringify(item))

      }
      .width('100%')
      .padding(10.0)
      .listDirection(Axis.Horizontal)
    }
    .width('100%')
    .backgroundColor(Color.White)

  }

  @Builder dayWetherList() {
    Column(){

      List({space: 5.0}){
        ForEach(this.wetherResModel.forecast_list, (item: WetherDayModel, index) => {
          ListItem(){
            Row(){
              Row(){
                Text(item.date.substring(5).replace('-', '/')).width(60).textAlign(TextAlign.Center).fontSize(12.0)
                // Text('今天').width(40).textAlign(TextAlign.Center).fontSize(12.0)
              }

              Text(item.condition).width(60).textAlign(TextAlign.Center).fontSize(12.0)
              Image(this.getConditionIcon(item.condition)).width(20).objectFit(ImageFit.Contain)

              Row(){
                Text(item.low_temperature).width(40).textAlign(TextAlign.Center).fontSize(12.0)
                Text(item.high_temperature).width(40).textAlign(TextAlign.Center).fontSize(12.0)
              }
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
            .padding(5.0)
          }
        }, item => JSON.stringify(item))
      }

    }
    .width('100%')
    .backgroundColor($r('app.color.color_divider'))

  }




}