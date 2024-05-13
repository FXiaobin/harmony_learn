import router from '@ohos.router'
import { HttpUtils } from '../../Utils/Http/HttpUtils'
@Entry
@Component
export struct SkillsPage {


  build(){

    Navigation() {
      Column() {
        Text('SkillsPage')

        Button(){
          Text('天气预报')
        }
        .onClick(()=>{
          router.pushUrl({
            url: 'pages/skills/wether/WetherPage',
          })
        })

      }
      .width('100%')
      .height('100%')
      .backgroundColor($r('app.color.color_pageBackground'))
    }
    .mode(NavigationMode.Auto)
    .title('功能')
    .titleMode(NavigationTitleMode.Mini)
    .hideBackButton(true)
    .backgroundColor($r('app.color.color_primary'))
    .width('100%')
    .height('100%')

  }



}