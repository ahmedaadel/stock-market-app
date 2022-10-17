import 'package:borsetak/Shared/components/components.dart';
import 'package:borsetak/models/tawsya_Model.dart';
import 'package:borsetak/modules/Admin/cubit/Admin_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminCubit extends Cubit<AdminStates>{
  AdminCubit():super(AdminInitialState());

  static AdminCubit get(context) => BlocProvider.of(context);

  void addTawsya({required String sahm,required String description
    ,required String priceBefore,required String priceAfter})
  {
    emit(AdminaddTawsyaLoadingState());
    tewsyaModel Taw = tewsyaModel(description: description,priceAfter: priceBefore,priceBefore: priceAfter,sahm: sahm);
    FirebaseFirestore.instance
        .collection('tawsya')
        .add(Taw.toMap()).
    then((value) {
      print('Done');
      emit(AdminaddTawsyaSuccessState());
      showToast(text: 'Done', state: ToastState.success);
    }).
    catchError((error){
      print(error.toString());
      showToast(text: error.toString(), state: ToastState.error);
      emit(AdminaddTawsyaErrorState());
    });

  }

}