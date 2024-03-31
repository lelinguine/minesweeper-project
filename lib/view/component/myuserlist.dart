import 'package:flutter/material.dart';
import 'package:minesweeper/view/component/mysetting.dart';
import 'package:minesweeper/view/component/input/mybutton.dart';
import 'package:minesweeper/view/mynavigate.dart';
import 'package:minesweeper/view/myaccount.dart';
import 'package:minesweeper/view/myconnect.dart';
import 'package:provider/provider.dart';
import 'package:minesweeper/provider/myusermanager.dart';

class MyUserList extends StatelessWidget {
  const MyUserList({Key? key});

  @override
  Widget build(BuildContext context) {
    final userManager = Provider.of<MyUserManager>(context);
    final currentUser = userManager.current;

    return SizedBox(
      height: 48,
      width: 400,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...userManager.listUsers.map((user) {
              final isCurrentUser = user == currentUser;

              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: MyButton(
                  action: () => pushOptions(context, MyAccount(user: user)),
                  color: isCurrentUser
                      ? const Color(0xFFffb703)
                      : Theme.of(context).secondaryHeaderColor,
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            user.pseudo.isNotEmpty
                                ? user.pseudo[0].toUpperCase()
                                : '',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color: isCurrentUser
                                      ? const Color(0xFFffb703)
                                      : Theme.of(context).secondaryHeaderColor,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: MyButton(
                color: Theme.of(context).secondaryHeaderColor,
                child: const MySetting(slot: '', size: 18),
                action: () => pushOptions(context, const MyConnect()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
