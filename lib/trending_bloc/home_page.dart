import 'package:avacado_test/trending_bloc/detail_page.dart';
import 'package:avacado_test/trending_bloc/trending_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: AppBar(
              toolbarHeight: 80.0,
              backgroundColor: Colors.green,
              titleSpacing: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  // Navigator.of(context).pop();
                },
              ),
              title: const Text(
                'Video',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.white),
              ),
              actions: const [
                Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
          body: const Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Material(
                  elevation: 2,
                  child: SizedBox(
                    height: 45,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                      child: TabBar(
                        isScrollable: true,
                        tabs: [
                          Tab(text: 'Trending'),
                          Tab(text: 'Trending'),
                          Tab(text: 'Trending'),
                          Tab(text: 'Trending'),
                          Tab(text: 'Trending'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    TrendingPage(),
                    Center(
                      child: Text(
                        'Tab 2 Content',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Tab 2 Content',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Tab 2 Content',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Tab 2 Content',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TrendingPage extends StatelessWidget {
  const TrendingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocProvider(
        create: (context) => TrendingBloc()..add(TrendingFetchingEvent()),
        child: RefreshIndicator(
          // backgroundColor: Theme.of(context).primaryColor,
          onRefresh: () async {
            // await Future.delayed(Duration(milliseconds: 1500));
            context.read<TrendingBloc>().add(TrendingFetchingEvent());
            // return true;
          },
          child: SingleChildScrollView(
            child: BlocConsumer<TrendingBloc, TrendingState>(
                listener: (context, state) {
              if (state is TrendingError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message!),
                  ),
                );
              }
              if (state is Navigation) {
                //we can use route nave for named route
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(data: state.indexData),
                  ),
                );
              }
            }, buildWhen: (previous, current) {
              if (current.runtimeType == TrendingError ||
                  current.runtimeType == Navigation) {
                return false;
              }
              return true;
            }, builder: (context, state) {
              if (state is TrendingInitial) {
                return Container();
              }
              if (state is Trendingloading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is TrendingError) {
                return Container();
              }
              if (state is TrendingLoaded) {
                return Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                            itemCount: state.data.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 12.0,
                                    mainAxisSpacing: 8.0),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  context.read<TrendingBloc>().add(
                                      NavigationEvent(
                                          "routeName", state.data[index]));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      // mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.data[index].title!
                                              .toUpperCase(),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  minimumSize:
                                                      Size.zero, // Set this
                                                  padding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.red // and this
                                                  ),
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 0.0,
                                                    horizontal: 8),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.play_arrow,
                                                      color: Colors.white,
                                                      size: 18,
                                                    ),
                                                    Text(
                                                      'Youtube',
                                                      style: TextStyle(
                                                          fontSize: 8,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Text(
                                              state.data[index].timestamp
                                                  .toString(),
                                              style:
                                                  const TextStyle(fontSize: 10),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Stack(
                                            children: [
                                              Image.network(
                                                "https://img.youtube.com/vi/6cwnBBAVIwE/0.jpg",
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                                // height: 2.0,
                                              ),
                                              Center(
                                                  child: Image.asset(
                                                "assets/images.png",
                                                height: 40,
                                                color: Colors.white,
                                              ))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })),
                  ],
                );
              } else {
                return Container();
              }
            }),
          ),
        ),
      );
    });
  }
}
