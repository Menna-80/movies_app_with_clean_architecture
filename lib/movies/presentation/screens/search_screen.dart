import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/core/utils/services_locator.dart';
import 'package:movies_app/movies/presentation/component/search_grid_view.dart';
import 'package:movies_app/movies/presentation/controller/search/search_bloc.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchBloc>(),
      child: const SearchWidget(),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 12,
            left: 16,
            right: 16,
          ),
          child: Column(
            children: [
              const SearchField(),
              BlocBuilder<SearchBloc, MovieSearchState>(
                builder: (context, state) {
                  switch (state.searchState) {
                    case RequestState.loading:
                      return const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    case RequestState.loaded:
                      return const SearchGridView();
                    case RequestState.error:
                      return SizedBox(
                          height: 400.0, child: Center(child: Text(state.searchMessage)));

                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    var searchControler = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
          key: formkey,
          child: TextFormField(
                controller: searchControler,
                onChanged: (value){
                  context.read<SearchBloc>().add(GetSearchEvent(value));
                },
                keyboardType: TextInputType.text,
               decoration:  InputDecoration(
                 label: Text('Search'),
                 prefixIcon:Icon(Icons.search_rounded) ,
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10.0),
                 ),
               ),

              ),

        ),
    );
  }
}
