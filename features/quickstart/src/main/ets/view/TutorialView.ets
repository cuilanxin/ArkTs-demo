import { ArticleClass } from '../model/ArticleClass';
import { bufferToString } from '../util/BufferUtil';

@Component
struct TutorialItem{
  @Prop tutorialItem: ArticleClass
  build() {
    Row(){
      Column(){
        Text(this.tutorialItem.title)
          .height(19)
          .width('100%')
          .fontSize(14)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(1)
          .fontWeight(400)
          .margin({ top: 4 })
        Text(this.tutorialItem.brief)
          .height(32)
          .width('100%')
          .fontSize(12)
          .textAlign(TextAlign.Start)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .maxLines(2)
          .fontWeight(400)
          .fontColor('rgba(0, 0, 0, 0.6)')
          .margin({ top: 5 })
      }
      .margin({right: 12})
      .alignItems(HorizontalAlign.Start)
      .height('100%')
      .layoutWeight(1)
      Image($r(this.tutorialItem.imageSrc))
        .width(108)
        .height(64)
        .borderRadius(16)
        .objectFit(ImageFit.Cover)
    }
    .width('100%')
    .height(88)
    .padding(12)
    .backgroundColor(Color.White )
    .borderRadius(16)
    .alignItems(VerticalAlign.Top)
  }
}


@Preview
@Component
export struct TutorialView {
  @State tutorialList: Array<ArticleClass> = [];

  aboutToAppear(): void {
    this.getTutorialFormJSON()
  }

  getTutorialFormJSON(){
    getContext(this).resourceManager.getRawFileContent('TutorialData.json').then(value => {
      let res: string = bufferToString(value)
      this.tutorialList = JSON.parse(res) as Array<ArticleClass>
    })
  }

  build() {
    Column(){
      Text('入门教程')
        .fontColor('#182431')
        .fontSize(16)
        .fontWeight(500)
        .fontFamily('HarmonyHeiTi-medium')
        .textAlign(TextAlign.Start)
        .padding({ left: 16 })
        .margin({ bottom: 8.5 })
      List({ space: 12 }) {
        ForEach(
          this.tutorialList,
          (item: ArticleClass) => {
            ListItem() {
              TutorialItem({ tutorialItem: item })
            }
          },
          (item: ArticleClass) => item.id
        )
      }
      .scrollBar(BarState.Off)
      .padding({ left: 16, right: 16 })
    }
    .margin({top: 18})
    .alignItems(HorizontalAlign.Start)
  }
}