import { QuickStartPage } from 'quickstart';


@Entry
@Component
struct Page {
  @State message: string = 'Hello World';

  build() {
    Column() {
      QuickStartPage()
    }
    .backgroundColor('#F1F3F5')
    .padding({ top: 36, bottom: 28 })
  }
}