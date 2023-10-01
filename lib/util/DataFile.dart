import 'package:flutter/cupertino.dart';
import 'package:flutter_diet_tips/model/CategoryModel.dart';
import 'package:flutter_diet_tips/model/DayModel.dart';
import 'package:flutter_diet_tips/model/DietModel.dart';
import 'package:flutter_diet_tips/model/DishModel.dart';
import 'package:flutter_diet_tips/model/FoodModel.dart';
import 'package:flutter_diet_tips/model/AdviceModel.dart';
import 'package:flutter_diet_tips/model/IntroModel.dart';
import 'package:flutter_diet_tips/model/ModelReminder.dart';
import 'package:flutter_diet_tips/model/NotificationModel.dart';
import 'package:flutter_diet_tips/model/SliderModel.dart';

class DataFile {



  static List<NotificationModel> getNotificationList() {
    List<NotificationModel> subCatList = [];

    NotificationModel mainModel = new NotificationModel();
    mainModel.time = "08:30 PM";
    mainModel.title = "Lorem Ipsum";
    mainModel.desc =
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.";
    subCatList.add(mainModel);

    mainModel = new NotificationModel();
    mainModel.time = "08:30 PM";
    mainModel.title = "Lorem Ipsum";
    mainModel.desc =
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.";
    subCatList.add(mainModel);

    mainModel = new NotificationModel();
    mainModel.time = "08:30 PM";
    mainModel.title = "Lorem Ipsum";
    mainModel.desc =
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.";
    subCatList.add(mainModel);
    mainModel = new NotificationModel();
    mainModel.time = "08:30 PM";
    mainModel.title = "Lorem Ipsum";
    mainModel.desc =
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.";
    subCatList.add(mainModel);
    mainModel = new NotificationModel();
    mainModel.time = "08:30 PM";
    mainModel.title = "Lorem Ipsum";
    mainModel.desc =
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.";
    subCatList.add(mainModel);

    return subCatList;
  }

  static List<ModelReminder> getReminderList() {
    List<ModelReminder> introList = [];


    ModelReminder mainModel = new ModelReminder();
    mainModel.id = 1;
    mainModel.time = "09:00 AM";
    mainModel.repeat = "Sun,Mon";
    mainModel.ison = true;
    introList.add(mainModel);

    mainModel = new ModelReminder();
    mainModel.id = 1;
    mainModel.time = "11:00 AM";
    mainModel.repeat = "Tue";
    mainModel.ison = false;
    introList.add(mainModel);


    return introList;
  }


  static List<IntroModel> getIntroModel(BuildContext context) {
    List<IntroModel> introList = [];

    IntroModel mainModel = new IntroModel();
    mainModel.id = 1;
    mainModel.name = "Welcome!";
    mainModel.image = "assets/images/img_1.0.png";
    mainModel.desc =
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.";
    introList.add(mainModel);

    mainModel = new IntroModel();
    mainModel.id = 2;
    mainModel.name = "Meal planner";
    mainModel.image = "assets/images/img_2.0.png";
    mainModel.desc =
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.";
    introList.add(mainModel);

    mainModel = new IntroModel();
    mainModel.id = 3;
    mainModel.name = "Health Manage";
    mainModel.image = "assets/images/img_3.0.png";
    mainModel.desc =
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.";
    introList.add(mainModel);

    return introList;
  }



  static getSliderList() {
    List<SliderModel> list = [];

    SliderModel model = new SliderModel();
    model.title = "7 Days Diet";
    model.image = "images_3.jpg";
    list.add(model);

    model = new SliderModel();
    model.title = "7 Days Flat Belly Diet";
    model.image = "images_11.jpg";
    list.add(model);

    model = new SliderModel();
    model.title = "7 Days Diet";
    model.image = "images_25.jpg";
    list.add(model);

    model = new SliderModel();
    model.title = "7 Days Diet";
    model.image = "images_3.jpg";
    list.add(model);

    model = new SliderModel();
    model.title = "7 Days Flat Belly Diet";
    model.image = "images_11.jpg";
    list.add(model);

    model = new SliderModel();
    model.title = "7 Days Diet";
    model.image = "images_25.jpg";
    list.add(model);

    model = new SliderModel();
    model.title = "7 Days Diet";
    model.image = "images_3.jpg";
    list.add(model);

    return list;
  }


  static getDietList() {
    List<DietModel> list = [];

    DietModel model = new DietModel();
    model.title = "Standard";
    model.subTitle = "I eat everything";
    model.image = "imoji_1.png";
    list.add(model);

    model = new DietModel();
    model.title = "Vegetarian";
    model.subTitle = "I can't eat meat and seafood";
    model.image = "imoji_2.png";
    list.add(model);

    model = new DietModel();
    model.title = "Vegan";
    model.image = "imoji_3.png";
    model.subTitle = "I can't eat animal Product";
    list.add(model);

    model = new DietModel();
    model.title = "Pescatarian";
    model.subTitle = "Vegetarian plus seafood";
    model.image = "imoji_4.png";
    list.add(model);

    model = new DietModel();
    model.title = "Gluten-Free";
    model.subTitle = "Gluten strictly excluded";
    model.image = "imoji_5.png";
    list.add(model);


    return list;
  }

  static getMealList() {
    List<DietModel> list = [];

    DietModel model = new DietModel();
    model.title = "Breakfast";
    model.image = "imoji_6.png";
    list.add(model);

    model = new DietModel();
    model.title = "Snack";
    model.image = "imoji_7.png";
    list.add(model);

    model = new DietModel();
    model.title = "Lunch";
    model.image = "imoji_8.png";
    list.add(model);

    model = new DietModel();
    model.title = "Dinner";
    model.image = "imoji_9.png";
    list.add(model);


    return list;
  }

  static getMotivateList() {
    List<DietModel> list = [];

    DietModel model = new DietModel();
    model.title = "Feeling confident";
    model.subTitle = "I want to be more confident in myself";
    model.image = "imoji_11.png";
    list.add(model);

    model = new DietModel();
    model.title = "Being noticed";
    model.subTitle = "I want to be repected,appreciated and loved";
    model.image = "imoji_12.png";
    list.add(model);

    model = new DietModel();
    model.title = "Being Active";
    model.image = "imoji_13.png";
    model.subTitle = "I want to feel energetic,fit and healthy";
    list.add(model);

    model = new DietModel();
    model.title = "Gaining muscle";
    model.subTitle = "I want to be and look stronger";
    model.image = "imoji_14.png";
    list.add(model);





    return list;
  }


  static getFoodList() {
    List<FoodModel> list = [];

    FoodModel model = new FoodModel();
    model.title = "BreakFast";
    model.image = "food_1.jpg";
    list.add(model);

    model = new FoodModel();
    model.title = "Snack";
    model.image = "food_2.jpg";
    list.add(model);

    model = new FoodModel();
    model.title = "Lunch";
    model.image = "food_3.jpg";
    list.add(model);

    model = new FoodModel();
    model.title = "Dinner";
    model.image = "food_4.jpg";
    list.add(model);






    return list;
  }

  static getVariedList() {
    List<DietModel> list = [];

    DietModel model = new DietModel();
    model.title = "Low Variety";
    model.subTitle = "Meals frequently repeated";
    list.add(model);

    model = new DietModel();
    model.title = "Medium Variety";
    model.subTitle = "Meals repeated from time to time";
    list.add(model);


    model = new DietModel();
    model.title = "High Variety";
    model.subTitle = "Meals rarely repeated";
    list.add(model);





    return list;
  }

  static getCategoryList() {
    List<CategoryModel> list = [];

    CategoryModel model = new CategoryModel();
    model.title = "7 Days Diet";
    model.image = "images_22.jpg";
    list.add(model);

    model = new CategoryModel();
    model.title = "7 Days Flat Belly Diet";
    model.image = "images_18.jpg";
    list.add(model);

    model = new CategoryModel();
    model.title = "Your Best Body Meal Plan";
    model.image = "images_12.jpg";
    list.add(model);

    model = new CategoryModel();
    model.title = "Easy eating plan for Weight Loss";
    model.image = "images_3.jpg";
    list.add(model);

    model = new CategoryModel();
    model.title = "Can you eat pizza everyday?";
    model.image = "images_11.jpg";
    list.add(model);

    model = new CategoryModel();
    model.title = "9 soup to make lose weight";
    model.image = "images_25.jpg";
    list.add(model);

    model = new CategoryModel();
    model.title = "7 Days Diet";
    model.image = "images_3.jpg";
    list.add(model);

    model = new CategoryModel();
    model.title = "7 Days Diet";
    model.image = "images_22.jpg";
    list.add(model);

    model = new CategoryModel();
    model.title = "7 Days Flat Belly Diet";
    model.image = "images_18.jpg";
    list.add(model);

    model = new CategoryModel();
    model.title = "7 Days Diet";
    model.image = "images_12.jpg";
    list.add(model);

    model = new CategoryModel();
    model.title = "7 Days Diet";
    model.image = "images_3.jpg";
    list.add(model);

    model = new CategoryModel();
    model.title = "7 Days Flat Belly Diet";
    model.image = "images_11.jpg";
    list.add(model);

    model = new CategoryModel();
    model.title = "7 Days Diet";
    model.image = "images_25.jpg";
    list.add(model);

    model = new CategoryModel();
    model.title = "7 Days Diet";
    model.image = "images_3.jpg";
    list.add(model);

    return list;
  }

  static getAdviceList() {
    List<AdviceModel> list = [];

    AdviceModel adviceModel = new AdviceModel();
    adviceModel.title = "Don't train everyday";
    adviceModel.image = "healthy_1.jpg";
    adviceModel.desc =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
    list.add(adviceModel);

    adviceModel = new AdviceModel();
    adviceModel.title = "Stick to free weights";
    adviceModel.image = "healthy_2.jpg";
    adviceModel.desc =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
    list.add(adviceModel);

    adviceModel = new AdviceModel();
    adviceModel.title = "Do Compound movements";
    adviceModel.image = "healthy_3.jpg";
    adviceModel.desc =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
    list.add(adviceModel);

    adviceModel = new AdviceModel();
    adviceModel.title = "Can we eat paneer";
    adviceModel.image = "healthy_4.jpg";
    adviceModel.desc =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
    list.add(adviceModel);

    adviceModel = new AdviceModel();
    adviceModel.title = "Is broccoli the  best for fitness?";
    adviceModel.image = "healthy_5.jpg";
    adviceModel.desc =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
    list.add(adviceModel);

    adviceModel = new AdviceModel();
    adviceModel.title = "Is broccoli the  best for fitness?";
    adviceModel.image = "healthy_6.jpg";
    adviceModel.desc =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
    list.add(adviceModel);

    return list;
  }

  static getDishList() {
    List<DishModel> list = [];

    DishModel model = new DishModel();
    model.title = "Healthy Fruity Oatmeal";
    model.image = "homemade_receipe.jpg";
    model.desc =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
    list.add(model);

    model = new DishModel();
    model.title = "Smoothie with Kiwi,Oranges and apple";
    model.image = "day_1.jpg";
    // model.image = "images_39.png";
    model.desc =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
    list.add(model);

    model = new DishModel();
    model.title = "Skinny Fried Egg";
    model.image = "day_2.jpg";
    model.desc =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
    list.add(model);

    model = new DishModel();
    model.title = "Sweet red Pre-workout Juice";
    model.image = "day_3.jpg";
    model.desc =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
    list.add(model);

    model = new DishModel();
    model.title = "Cucumber Detox Water";
    model.image = "day_4.jpg";
    model.desc =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
    list.add(model);

    model = new DishModel();
    model.title = "Mixed Vegetable Salad";
    model.image = "img_5.jpg";
    model.desc =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
    list.add(model);

    model = new DishModel();
    model.title = "Sauteed Vegetables with Paneer";
    model.image = "img_6.jpg";
    model.desc =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
    list.add(model);

    model = new DishModel();
    model.title = "Skim Milk Yoghurt";
    model.image = "img_2.jpg";
    model.desc =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
    list.add(model);

    model = new DishModel();
    model.title = "Coffee with Milk and Less Sugar";
    model.image = "img_4.jpg";

    model.desc =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
    list.add(model);

    return list;
  }

  static getDayList() {
    List<DayModel> list = [];

    DayModel model = new DayModel();
    model.name = "7 Day Diet - Day 1";
    model.image = "day_1.jpg";
    list.add(model);

    model = new DayModel();
    model.name = "7 Day Diet - Day 2";
    model.image = "day_2.jpg";
    list.add(model);

    model = new DayModel();
    model.name = "7 Day Diet - Day 3";
    model.image = "day_3.jpg";
    list.add(model);

    model = new DayModel();
    model.name = "7 Day Diet - Day 4";
    model.image = "day_4.jpg";
    list.add(model);

    model = new DayModel();
    model.name = "7 Day Diet - Day 5";
    model.image = "day_1.jpg";
    list.add(model);

    model = new DayModel();
    model.name = "7 Day Diet - Day 6";
    model.image = "day_2.jpg";
    list.add(model);

    model = new DayModel();
    model.name = "7 Day Diet - Day 7";
    model.image = "day_3.jpg";
    list.add(model);



    return list;
  }

}
