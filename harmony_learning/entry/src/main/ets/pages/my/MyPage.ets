import Prompt from '@system.prompt'
@Entry
@Component
export struct MyPage {

  pics: Resource[] = [$r('app.media.mine_QD'),
  $r('app.media.my_message'),
  $r('app.media.my_download'),
  $r('app.media.mine_SC'),
  $r('app.media.mine_history')]
  titles: string[] = ['签到', '消息', '下载', '收藏', '浏览历史']


  moreTitles: string[] = ['开票', '客服', '意见反馈', '我的工作台', '我的卡券', '积分商城']
  morePics: Resource[] = [$r('app.media.mine_KP'),
  $r('app.media.mine_KF'),
  $r('app.media.mine_YJFK'),
  $r('app.media.mine_work'),
  $r('app.media.mine_card'),
  $r('app.media.my_jfsc')]

  build() {

    Navigation() {
      Column() {
        Scroll() {
          Column() {
            // Text('MyPage')

            Stack({
              alignContent: Alignment.Bottom
            }) {

              Row() {
                Image($r('app.media.avatar_icon')).width(60).height(60).objectFit(ImageFit.Contain).borderRadius(30)
                Column() {
                  Text('SVIP会员').fontColor('#FFE9CD').fontSize(22).fontWeight(FontWeight.Medium)
                  Text('您的会员还有123天到期').fontColor('#FFE9CD').fontSize(13)
                    .fontWeight(FontWeight.Medium).lineHeight(26)
                }
                // .height(60)
                .alignItems(HorizontalAlign.Start)
                .margin({
                  left: 12
                })

              }
              .alignItems(VerticalAlign.Top)
              .width('100%')
              .height(140)
              .backgroundColor($r('app.color.color_primary'))
              .margin({
                bottom: 30.0
              })
              .padding({
                top: 20,
                left: 12,
                right: 12,
              })

              Row() {
                Row() {
                  Image($r('app.media.my_vip')).width(30).objectFit(ImageFit.Contain)
                  Column() {
                    Text('SVIP会员').fontColor('#FFE9CD').fontSize(16).fontWeight(FontWeight.Medium)
                    Text('您的会员还有123天到期').fontColor('#FFE9CD').fontSize(13)
                      .fontWeight(FontWeight.Medium).lineHeight(20)
                  }
                  .alignItems(HorizontalAlign.Start)
                  .margin({
                    left: 12
                  })

                  Blank()

                  Button() {
                    Text('立即续费').fontColor('#3A372F').fontSize(14)
                  }
                  .stateEffect(false)
                  .padding({
                    left: 10,
                    right: 10,
                    top: 5,
                    bottom: 5
                  })
                  // .backgroundColor('#F5C99B')
                  // 按钮自带颜色  需要设置成透明色
                  .backgroundColor(Color.Transparent)
                  .backgroundImage($r('app.media.my_open_vip_bg'))
                  .backgroundImageSize(ImageSize.Cover)
                }
                .margin({
                  left: 12,
                  right: 12
                })
                .padding({
                  left: 20,
                  right: 20
                })
                .layoutWeight(1)
                .height('100%')
                // .backgroundColor('#454035')
                .backgroundImage($r('app.media.my_vip_bg'))
                .backgroundImageSize(ImageSize.Cover)
                .borderRadius(6.0)
              }
              .height(60)
              .width('100%')
              // .backgroundColor(Color.Green)
            }


            Row(){
              ForEach(this.titles, (title, index)=>{
                Column(){
                  Image(this.pics[index]).width(32).height(32).objectFit(ImageFit.Contain)
                  Text(title).fontSize(16).fontColor($r('app.color.color_8D9299')).lineHeight(26)
                }
                .padding(10)
                .onClick(()=>{
                  Prompt.showToast({
                    message: title
                  })
                })

              }, item => item)

            }
            .justifyContent(FlexAlign.SpaceAround)
            .width('100%')
            .height(80)
            .backgroundColor(Color.White)
            .margin({
              top: 10,
              bottom: 10
            })

            Row() {

              Column(){
                Text('更多功能').fontSize(22).fontWeight(FontWeight.Bold).height(50.0)

                ForEach(this.moreTitles, (title, index)=>{
                  Column(){
                    Row(){
                      Image(this.morePics[index]).width(20).height(20).objectFit(ImageFit.Contain)
                      Text(title).fontSize(16).height(50.0).margin({left: 10.0})
                      Blank()
                      Image($r('app.media.arrow_right_gray')).width(24).height(24)
                    }
                    .width('100%')
                    .height(50)
                    .onClick(()=>{
                      Prompt.showToast({
                        message: title
                      })
                    })
                    Divider()
                      .height(0.5)
                      .color($r('app.color.color_divider'))
                      .width('100%')
                  }


                }, item=>item)

              }
              // 占满一行，但它外面必须套一层row时才可以使用这个属性
              .layoutWeight(1)
              // .height(350)
              .borderRadius(10)
              .shadow({
                color: $r('app.color.color_B1B8C1'),
                radius: 3.0
              })
              .alignItems(HorizontalAlign.Start)
              .padding({
                left: 12,
                right: 12
              })
              .backgroundColor(Color.White)

            }
            .width('100%')
            // .backgroundColor(Color.Brown)
            .padding(12)

            // 底部加高 防止不满一屏时 滚动视图跳动
            Row().height(100).width('100%')
              // .backgroundColor(Color.Pink)
          }
          .width('100%')
        }
        .scrollable(ScrollDirection.Vertical)
        .scrollBar(BarState.Auto)
        .scrollBarWidth(2.0)
        .scrollBarColor(Color.Pink)
        // .backgroundColor(Color.Orange)
        // 这两行是为了：当内容不满一屏幕时 滚动视图仍然占一屏
        // .layoutWeight(1)
        .height('100%')
        .align(Alignment.Top)
        .edgeEffect(EdgeEffect.Spring)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
      .backgroundColor($r('app.color.color_pageBackground'))
    }
    .mode(NavigationMode.Auto)
    .title(this.navTitle())
    .titleMode(NavigationTitleMode.Mini)
    .hideBackButton(true)
    .backgroundColor($r('app.color.color_primary'))
    .width('100%')
    .height('100%')

  }

  @Builder navTitle() {
    Column(){
      Text('我的')
        .fontColor(Color.White)
        .fontSize(22.0)
        .fontWeight(FontWeight.Medium)
        .textAlign(TextAlign.Center)
        .width('100%')
    }
  }
}