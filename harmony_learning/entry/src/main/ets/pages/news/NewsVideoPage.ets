import router from '@ohos.router'
import { CustomNavigationBar } from '../../common/CustomNavigationBar/CustomNavigationBar'
import { NewsVideoItemModel } from './NewsModel'
@Entry
@Component
export struct NewsVideoPage {

  @State detailItem: NewsVideoItemModel = null

  private controller: VideoController = new VideoController()

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
        Video({
          src: this.detailItem.mp4_url,
          previewUri: this.detailItem.cover,
          controller: this.controller
        })
          .width('100%')
          .height(300)
          .autoPlay(false)
          .controls(true)
          .objectFit(ImageFit.Contain)
          .onStart(()=>{
            console.info('onStart')
          })
          .onPause(() => {
            console.info('onPause')
          })
          .onFinish(() => {
            console.info('onFinish')
          })
          .onError(() => {
            console.info('onError')
          })
          .onPrepared((e) => {
            console.info('onPrepared is ' + e.duration)
          })
          .onSeeking((e) => {
            console.info('onSeeking is ' + e.time)
          })
          .onSeeked((e) => {
            console.info('onSeeked is ' + e.time)
          })
          .onUpdate((e) => {
            console.info('onUpdate is ' + e.time)
          })

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