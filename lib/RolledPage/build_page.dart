import 'package:flutter/material.dart';

class BuildPage extends StatelessWidget {
  final double height;
  final double horizontalPadding;
  final double bottomPadding;
  const BuildPage(
      {Key? key,
      required this.height,
      required this.horizontalPadding,
      required this.bottomPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          horizontalPadding,
          0,
          horizontalPadding,
          bottomPadding),
      height: height,
      width: double.infinity,
      color: Colors.white,
      child: Text(
          """In publishing and graphic design, Lorem ipsum (/ˌlɔː.rəm ˈɪp.səm/) is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.
          Lorem ipsum is typically a corrupted version of De finibus bonorum et malorum, a 1st-century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin. The first two words themselves are a truncation of dolorem ipsum ("pain itself").
      """),
    );
  }
}
