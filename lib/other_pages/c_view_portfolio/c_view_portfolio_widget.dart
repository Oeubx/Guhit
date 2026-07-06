import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_view_portfolio_model.dart';
export 'c_view_portfolio_model.dart';

class CViewPortfolioWidget extends StatefulWidget {
  const CViewPortfolioWidget({
    super.key,
    required this.userID,
  });

  final ArtistAvailabilityRow? userID;

  @override
  State<CViewPortfolioWidget> createState() => _CViewPortfolioWidgetState();
}

class _CViewPortfolioWidgetState extends State<CViewPortfolioWidget> {
  late CViewPortfolioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CViewPortfolioModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          Navigator.pop(context);
        },
        child: Container(
          width: double.infinity,
          height: 500.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(25.0),
            child: FutureBuilder<List<UploadsRow>>(
              future: UploadsTable().queryRows(
                queryFn: (q) => q
                    .eqOrNull(
                      'uploader_Id',
                      widget!.userID?.artistIdRef,
                    )
                    .eqOrNull(
                      'isPortfolio',
                      true,
                    )
                    .order('last_updated_at'),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<UploadsRow> staggeredViewUploadsRowList = snapshot.data!;

                return MasonryGridView.builder(
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  itemCount: staggeredViewUploadsRowList.length,
                  itemBuilder: (context, staggeredViewIndex) {
                    final staggeredViewUploadsRow =
                        staggeredViewUploadsRowList[staggeredViewIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          PageViewUploadWidget.routeName,
                          queryParameters: {
                            'idReference': serializeParam(
                              staggeredViewUploadsRow,
                              ParamType.SupabaseRow,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            staggeredViewUploadsRow.uploadimgURL!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
