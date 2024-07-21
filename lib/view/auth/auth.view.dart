import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:horizon/core/extensions/context_extension.dart';
import 'package:horizon/core/extensions/widget_extension.dart';
import 'package:horizon/product/components/button.dart';
import 'package:horizon/product/theme/theme.service.dart';
import 'package:horizon/view/auth/auth.viewmodel.dart';

import '../../core/base/base_view.dart';
import '../../core/enums/app_theme.dart';

/// Created by Balaji Malathi on 7/21/2024 at 18:09.
class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  String username = "";

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
      onModelReady: (AuthViewModel model) {
        model.setContext(context);
        model.init();
      },
      builder: (context, model, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            ThemeService.changeTheme(context);
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              ThemeService.getTheme(context) == AppThemes.light
                  ? "assets/svg/horizon-dark.svg"
                  : "assets/svg/horizon-light.svg",
              height: 60,
            ).pt(56),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FormBuilder(
                      key: model.formKey,
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Email"),
                              FormBuilderTextField(
                                readOnly: model.formLoading,
                                decoration: const InputDecoration(
                                    hintText: "john.doe@splenta.com"),
                                keyboardType: TextInputType.emailAddress,
                                name: 'email',
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.email()
                                ]),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Password"),
                              FormBuilderTextField(
                                readOnly: model.formLoading,
                                decoration:
                                    const InputDecoration(hintText: "********"),
                                name: 'password',
                                validator: FormBuilderValidators.compose(
                                    [FormBuilderValidators.required()]),
                              ),
                            ],
                          ),
                          LoadingButton.loading(
                            style: LoadingButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              minimumSize: const Size(double.infinity, 48),
                            ),
                            onPressed: () async {
                              if (model.formLoading) return;
                              if (model.formKey.currentState
                                      ?.saveAndValidate() ??
                                  false) {
                                FocusManager.instance.primaryFocus?.unfocus();
                                var formVal = model.formKey.currentState!.value;
                                debugPrint(formVal.toString());
                                model.login(formVal);
                              } else {
                                debugPrint(model.formKey.currentState?.value
                                    .toString());
                                debugPrint('validation failed');
                              }
                            },
                            isLoading: model.formLoading,
                            loading: CircularProgressIndicator(
                              color: context.colors.secondary,
                              strokeWidth: 2,
                            ),
                            child: const Text("Continue"),
                          ),
                        ].divide(const SizedBox(
                          height: 16,
                        )),
                      )),
                  Text(
                    "By registering you accept the privacy policy and the terms of conditions",
                    style: context.textTheme.labelLarge,
                    textAlign: TextAlign.center,
                  ).pb(8),
                ],
              ).phv(16, 16),
            )
          ],
        ),
      ),
    );
  }
}
