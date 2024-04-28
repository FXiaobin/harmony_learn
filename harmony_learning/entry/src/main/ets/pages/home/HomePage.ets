import Prompt from '@system.prompt'
import router from '@ohos.router'
import { CustomNavigationBar } from '../../common/CustomNavigationBar/CustomNavigationBar'
@Entry
@Component
export struct HomePage {

  // 自定义右侧搜索按钮
  @Builder navigationRight() {
    Button(){
      Image($r('app.media.search_black')).width(20).height(20)
    }
    .width(44)
    .height(44)
    .margin({right: 2.0})
    .backgroundColor(Color.Transparent)
    .onClick(()=>{
      router.pushUrl({
          url: 'pages/home/SearchPage'
      })
    })
  }

  build() {

    Column() {
      // 自定义导航提
      CustomNavigationBar({
        title: '首页',
        trailingBuildParam: this.navigationRight
      })


      Column(){
        Text('HomePage')

      }
      .width('100%')
      .layoutWeight(1)
      .backgroundColor(Color.Yellow)


    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.color_pageBackground'))
  }

  // @Builder navigationTitle() {
  //
  //   Text('首页')
  //     .fontSize(18)
  //     .fontColor($r('app.color.color_white'))
  //
  // }

  // build(){
  //
  //   Navigation() {
  //     Column() {
  //       Text('HomePage')
  //
  //     }
  //     .width('100%')
  //     .height('100%')
  //     .backgroundColor($r('app.color.color_pageBackground'))
  //   }
  //   .mode(NavigationMode.Auto)
  //   .title({
  //     builder: this.navigationTitle(),
  //     height: 56
  //   })
  //   .titleMode(NavigationTitleMode.Mini)
  //   .hideBackButton(true)
  //   .backgroundColor($r('app.color.color_primary'))
  //   .width('100%')
  //   .height('100%')
  //
  //
  // }
}