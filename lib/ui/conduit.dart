
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/conduit/conduit_bloc.dart';

class ConduitPage extends StatefulWidget {
  const ConduitPage({super.key});

  @override
  State<ConduitPage> createState() => _ConduitPageState();
}

class _ConduitPageState extends State<ConduitPage> {
    @override
  void initState() {
   context.read<ConduitBloc>()..add(ConduitLoadingEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConduitBloc, ConduitState>(
      builder: (context, state) {
        if(state is ConduitLoadingState){
          return CircularProgressIndicator();
        }
        if(state is ConduitLoadedState){

        }
        if(state is ConduitErrorstate){
          
        }
        return Container();
      },
    );
  }
}
