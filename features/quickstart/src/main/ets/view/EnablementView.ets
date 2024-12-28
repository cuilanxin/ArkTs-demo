import { ArticleClass } from '../model/ArticleClass';
import { bufferToString } from '../util/BufferUtil';

@Component
struct EnablementItem {
  @Prop enablementItem: ArticleClass;
  // private title: string = 'HarmonyOS第一课'
  // private brief: string = '基于真实的开发场景，提供向导式学习，多维度融合课程等内容，给开发者提供全新的学习体验'

  build() {
    Column(){
      Image($r(this.enablementItem.imageSrc))
        .width('100%')
        .borderRadius({topLeft: 16, topRight: 16})
        .height(96)
        .objectFit(ImageFit.Cover)
      Text(this.enablementItem.title)
        .height(19)
        .width('100%')
        .fontSize(14)
        .textAlign(TextAlign.Start)
        .textOverflow({overflow: TextOverflow.Ellipsis})
        .maxLines(1)
        .padding({left: 12, right: 12})
        .margin({top:8})
      Text(this.enablementItem.brief)
        .height(32)
        .width('100%')
        .fontSize(12)
        .textAlign(TextAlign.Start)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(2)
        .fontWeight(400)
        .fontColor('rgba(0, 0, 0, 0.6)')
        .padding({ left: 12, right: 12 })
        .margin({ top: 2 })
    }
    .borderRadius(16)
    .backgroundColor(Color.White)
    .width(160)
    .height(169)
  }
}

// const title: string = 'Step1 快速入门介绍';
// const brief: string = '本篇教程实现了快速入门——一个用于了解和学习HarmonyOS的应用程序 。';

@Preview
@Component
export struct EnablementView{
  // $r('app.media.banner_pic0')
  @State enablementList: Array<ArticleClass> = [];

  aboutToAppear(): void {
    this.getEnablementDataFormJSON()
  }

  getEnablementDataFormJSON() {
    getContext(this).resourceManager.getRawFileContent('EnablementData.json').then(value => {
      let res: string = bufferToString(value)
      this.enablementList = JSON.parse(res) as Array<ArticleClass>
    })
  }

  build() {
    Column() {
      Text('赋能套件')
        .fontColor('#182431')
        .fontSize(16)
        .fontWeight(500)
        .fontFamily('HarmonyHeiTi-medium')
        .textAlign(TextAlign.Start)
        .padding({ left: 16 })
        .margin({ bottom: 8.5 })
      Grid() {
        ForEach(
          this.enablementList,
          (item: ArticleClass)=>{
            GridItem(){
              EnablementItem({ enablementItem: item })
            }
          },
          (item: ArticleClass) => item.id
        )
      }
      .rowsTemplate('1fr')
      .columnsGap(8)
      .scrollBar(BarState.Off)
      .height(169)
      .padding({ top: 2, left: 16, right: 16 })
    }
    .margin({top: 18})
    .alignItems(HorizontalAlign.Start)
  }
}

function buferToString(value: Uint8Array): string {
  throw new Error('Function not implemented.');
}
