// ignore_for_file: constant_identifier_names

import 'package:practice_app/models/blog.dart';

import 'package:practice_app/models/invoice.dart';
import 'package:practice_app/models/notificationM.dart';

import 'package:practice_app/models/plantGuide.dart';

import 'package:practice_app/models/storiesData.dart';

const DummyNotification =  [
  NotificationClass(
    id: '1',
    name: 'John doe',
    details:
        'commented your comment on How to produce best fertilizer for tomatoes.',
    type: 'Article',
    time: '1 hr ago',
  ),
  NotificationClass(
    id: '2',
    name: 'Samantha',
    details: 'Check-in to Blooming Garden',
    type: 'Check in',
    time: '3 hr ago',
  ),
  NotificationClass(
    id: '3',
    name: 'Apple, Blueberry, Carrot, Mango And Almond',
    details: 'need to watering now!',
    type: 'Plants',
    time: '2 hrs ago',
  ),
  NotificationClass(
    id: '4',
    name: 'Robert',
    details: 'Jordan Check-in to Blooming Garden',
    type: 'Check In',
    time: '4 hrs ago',
  ),
  NotificationClass(
    id: '5',
    name: 'Harvestmoon Garden',
    details: 'want to tread their 4 ton Carrot with your 3 tons tomatoes',
    type: 'Trafe',
    time: '4 hrs ago',
  ),
  NotificationClass(
    id: '6',
    name: 'Robert Jordan',
    details: 'Check-in to Blooming Garden',
    type: 'Check in to Blooming Garden',
    time: '1 hr ago',
  ),
  NotificationClass(
    id: '7',
    name: 'Apple, Blueberry, Carrot, Mango And Almond',
    details: 'eed to watering now!',
    type: 'Plants',
    time: '4 hr ago',
  ),
  NotificationClass(
    id: '8',
    name: 'Apple, Blueberry, Carrot, Mango And Almond',
    details: 'eed to watering now!',
    type: 'Plants',
    time: '4 hr ago',
  ),
];

const DummyStories =  [
  StoriesData(
    id: 's1',
    title: 'Grass',
    category: 'Tropical Grass',
    imageAsset: 'assets/images/storyone.jpg',
  ),
  StoriesData(
    id: 's2',
    title: 'Flower',
    category: 'Tropical Grass',
    imageAsset: 'assets/images/storytwo.jpg',
  ),
  StoriesData(
    id: 's3',
    title: 'Grass',
    category: 'Tropical Grass',
    imageAsset: 'assets/images/storythree.jpg',
  ),
];

const DummyBlog =  [
  BlogData(
    id: '1',
    asset: 'assets/images/handplant.png',
    date: 'May 20th,2019',
    title: 'Plant Parenthood 101',
    parah:
        'Aenean vel leo eget massa sollicitudin placerat non ut est. Donec enim augue, pellentesque et sapien non, vehicula pretium nisi. Mauris scelerisque interdum libero.',
  ),
  BlogData(
    id: '2',
    asset: 'assets/images/storyone.jpg',
    date: 'May 23rd,2019',
    title: 'Ferns in the Shower',
    parah:
        'Aenean vel leo eget massa sollicitudin placerat non ut est. Donec enim augue, pellentesque et sapien non, vehicula pretium nisi. Mauris scelerisque interdum libero.',
  ),
  BlogData(
    id: '3',
    asset: 'assets/images/storytwo.jpg',
    date: 'May 23rd,2019',
    title: 'Purple Heart Propagation',
    parah:
        'Aenean vel leo eget massa sollicitudin placerat non ut est. Donec enim augue, pellentesque et sapien non, vehicula pretium nisi. Mauris scelerisque interdum libero.',
  ),
];

const DummyInvoiceData =  [
  InvoiceData(
    id: '1',
    orderNumber: 'VBC0123456',
    date: 'May 23rd, 2019',
    paymentMethod: 'VISA...123',
    customerAdress: '5520 Quebec Place',
    customerName: 'Mr. Douglas E. Carter',
  ),
];

const DummyPlantGuide =  [
  PlantGuide(
    id: '1',
    title: 'Grass',
    imageAsset: 'assets/images/pgone.jpg',
  ),
  PlantGuide(
    id: '2',
    title: 'Ficus',
    imageAsset: 'assets/images/pgtwo.jpg',
  ),
  PlantGuide(
    id: '3',
    title: 'Orchid',
    imageAsset: 'assets/images/pgthree.jpg',
  ),
  PlantGuide(
    id: '4',
    title: 'Guides',
    imageAsset: 'assets/images/pgcommon.jpg',
  ),
  PlantGuide(
    id: '5',
    title: 'Calathea',
    imageAsset: 'assets/images/pgfour.jpg',
  ),
  PlantGuide(
    id: '6',
    title: 'Peperomia',
    imageAsset: 'assets/images/pgfive.jpg',
  ),
  PlantGuide(
    id: '7',
    title: 'Plant Care',
    imageAsset: 'assets/images/pgcommon.jpg',
  ),
  PlantGuide(
    id: '8',
    title: 'Dracaena',
    imageAsset: 'assets/images/pgsix.jpg',
  ),
  PlantGuide(
    id: '9',
    title: 'Bromeliads',
    imageAsset: 'assets/images/pgseven.jpg',
  ),
  PlantGuide(
    id: '10',
    title: 'Bonsai',
    imageAsset: 'assets/images/pgeight.jpg',
  ),
];

// var DummyShippingAdress = [
//   ShippingAdress(
//     id: 1,
//     name: 'Mr. William J.Briant',
//     adress: '6170 Peshawar Place',
//   ),
//   ShippingAdress(
//     id: 2,
//     name: 'Mr. Douglas E. Carter',
//     adress: '5520 Quebec Place',
//   ),
//   ShippingAdress(
//     id: 3,
//     name: 'Mr.Douglas E. Carter',
//     adress: '32 Wilson Street',
//   ),
// ];
