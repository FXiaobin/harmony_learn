import router from '@ohos.router'
import webview from '@ohos.web.webview'
import { CustomNavigationBar } from '../../common/CustomNavigationBar/CustomNavigationBar'
import { NewsItemModel } from './NewsModel'
@Entry
@Component
export struct NewsDetailPage {

  @State detailItem: NewsItemModel = null

  private webviewController = new webview.WebviewController

  aboutToAppear(){
    let item = router.getParams()['item']
    this.detailItem = item
  }

  build() {
    Column(){
      CustomNavigationBar({
        title: this.detailItem.title ?? '详情',
        showBack: true,
        navBarColor: Color.Orange,
        titleWidth: '80%',
        leadingBuildParam: null,
        centerBuildParam: null,
        trailingBuildParam: null
      })

      Column(){
        Web({
          src: this.detailItem.url,
          controller: this.webviewController
        })
          .imageAccess(true)
          .javaScriptAccess(true)

      }
      .width('100%')
      .layoutWeight(1)
      .backgroundColor(Color.Yellow)

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.color_pageBackground'))
  }
}