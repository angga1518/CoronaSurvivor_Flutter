part of 'shared_ui.dart';

Future showPopUp({
  @required BuildContext context,
  bool barrierDismissible = true,
  @required Widget child,
  Color barrierColor = UIHelper.colorGreySuperLight
}) {
  if (barrierColor == UIHelper.colorGreySuperLight) {
    barrierColor = barrierColor.withAlpha(116);
  }

  return showGeneralDialog(
    context: context,
    pageBuilder: (_, __, ___) {
      return SafeArea(
        child: child,
      );
    },
    barrierColor: barrierColor,
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    transitionDuration: const Duration(milliseconds: 150),
    useRootNavigator: true,
  );
}