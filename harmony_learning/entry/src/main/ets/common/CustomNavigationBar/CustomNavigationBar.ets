import Prompt from '@system.prompt'
import router from '@ohos.router'
@Component
export struct CustomNavigationBar {

  // 状态栏高度
  private statusBarHeight = 0.0
  // 状态栏颜色
  private statusBarColor: Color | Resource = Color.Black

  // 导航条高度
  private navBarHeight = 56.0
  // 导航条颜色
  private navBarColor: ResourceColor = Color.White
  // 导航条标题
  private title = '标题'
  private titleFont = 24.0
  private titleColor = Color.Black

  // 标题默认居中
  private  titleAlign: FlexAlign = FlexAlign.Center
  // 标题居左时，距离左侧间距
  private  leading = 20.0
  private titleWidth: Length = '100%'

  // 是否显示返回按钮
  private showBack = false
  // 返回按钮 - 点击事件
  onBackClick: () => void

  // 是否显示搜索框
  private showSearch = false
  // 搜索框-默认文本
  @State searchText: string = ''
  // 搜索框-提示文本
  private placeholder = '请输入搜索内容'
  // 搜索框-背景颜色
  private textInputColor = $r('app.color.color_F5F5F5')
  // 搜索按钮-点击事件
  onSearchClick: (searchText: string) => void
  // 搜索输入框内容改变事件
  onChange: (searchText: string) => void
  // 搜索输入框内容提交事件
  onSubmit: () => void

  // 左侧自定义组件
  @BuilderParam leadingBuildParam?: () => void
  // 中间自定义组件
  @BuilderParam centerBuildParam?: () => void
  // 右侧自定义组件
  @BuilderParam trailingBuildParam?: () => void



  build() {
    Column(){
      // 状态栏
      Row()
        .backgroundColor(this.statusBarColor)
        .height(this.statusBarHeight)
        .width('100%')

      Stack(){
        // 底层Row：让标题一直居中显示
        Row({ space: 12.0 }){

          Text(this.title)
            .fontColor(this.titleColor)
            .fontSize(this.titleFont)
            .fontWeight(FontWeight.Medium)
            .maxLines(1)
            .textOverflow({
              overflow: TextOverflow.Ellipsis
            })
            .width(this.titleWidth)
            .textAlign(this.titleAlign == FlexAlign.Start ? TextAlign.Start : TextAlign.Center)
            .margin({
              left: this.titleAlign == FlexAlign.Start ? this.leading : 0.0
            })
        }
        .alignItems(VerticalAlign.Center)
        .justifyContent(this.titleAlign)
        .backgroundColor(this.navBarColor)
        .height(this.navBarHeight)
        .width('100%')


        // 顶层Row：布局左中右内容显示
        Row({ space: 12.0 }){

          if (this.leadingBuildParam != null) {
            this.leadingBuildParam()

          }else{
            if (this.showBack) {
              Button({type: ButtonType.Normal, stateEffect: false}) {
                Image($r('app.media.nav_back_white')).width(24).height(24)
              }
              .backgroundColor(Color.Transparent)
              .width(44)
              .height(44)
              .margin({
                left: 0
              })
              .onClick(()=>{
                console.log('+++ navigation back button click ')

                if (this.onBackClick) {
                  this.onBackClick()
                } else {
                  router.back()
                }

              })

            }else{
              // 这里的目的是：防止当左侧不需要显示内容时，这一行只有一个右侧组件，
              // 只有一个组件时本来在右侧的内容会显示到左边
              if (!this.showSearch) {
                Blank()
                // .backgroundColor(Color.Orange)
              }

            }
          }

          if (this.centerBuildParam) {
            this.centerBuildParam()

          }else{
            if (this.showSearch) {
              TextInput({
                placeholder: this.placeholder,
                text: this.searchText,

              })
                .enterKeyType(EnterKeyType.Search)
                .caretColor($r('app.color.color_primary'))
                .fontSize(18)
                .layoutWeight(1)
                .height(40)
                .backgroundColor(this.textInputColor)
                .margin({
                  left: this.showBack ? -12.0 : 12.0,
                })
                .onChange((value)=>{
                  this.searchText = value
                  if (this.onChange) {
                    this.onChange(value)
                  }
                })
                .onSubmit(()=>{
                  if (this.onSubmit) {
                    this.onSubmit()
                  }
                })
            }
          }

          if (this.trailingBuildParam) {
            this.trailingBuildParam()
          }else{


            if (this.showSearch) {

              Button('搜索', { type: ButtonType.Normal, stateEffect: false })
                .borderRadius(8)
                // .backgroundColor(Color.White)
                .fontSize(18)
                // .fontColor($r('app.color.color_primary'))
                // .height(40)
                .margin({
                  right: 12.0
                })
                // 设置背景时可以设置内边距
                .padding(3)
                .onClick(()=>{
                  console.log('+++ navigation back button click ')

                  // Prompt.showToast({
                  //   message: this.searchText
                  // })

                  if (this.onSearchClick) {
                    // if (this.searchText.length <= 0) {
                    //   Prompt.showToast({
                    //     message: '请输入搜索内容'
                    //   })
                    //   return
                    // }
                    this.onSearchClick(this.searchText)
                  }

                })
            }
          }


       }
       .alignItems(VerticalAlign.Center)
       .justifyContent(FlexAlign.SpaceBetween)
       // .backgroundColor(Color.Orange)
       .height(this.navBarHeight)
       .width('100%')

      }

    }
    .width('100%')
  }
}