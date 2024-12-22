import { Banner } from '../view/Banner';
import { EnablementView } from '../view/EnablementView';
import { TutorialView } from '../view/TutorialView';

@Entry
@Component
struct Index {
  @State message: string = '快速入门';
  build() {
    RelativeContainer() {
      Column() {
        Text(this.message)
          .fontSize(24)
          .fontWeight(700)
          .width('100%')
          .textAlign(TextAlign.Start)
          .padding({ left: 16 })
          .fontFamily('HarmonyHeiTi-Bold')
          .lineHeight(33)
        Scroll() {
          Column() {
            Banner()
            EnablementView()
            TutorialView()
          }
        }
        .scrollBar(BarState.Off)
        .align(Alignment.TopStart)
        .layoutWeight(1)
      }
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#f1f3f5')
  }
}
