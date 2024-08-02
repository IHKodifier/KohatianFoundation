import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:kohatian_foundation/widget_export.dart';

class Entry extends Equatable {
  final String name;
  final String number;
  final int strength;
  Timestamp startDate;
  Timestamp endDate;
  final String? title;
  final String? slogan;
  final List<Cadet>? houseCommanders;
  final List<Cadet>? seniorSectionCommanders;
  final List<Cadet>? sectionCommanders;
  //entry title winners
  final Cadet? bestCadet;
  final Cadet? bestStudent;
  final Cadet? bestSportman;
  final Cadet? bestGymnast;
  final Cadet? bestDrillCommander;
  final Cadet? bestRider;
  final Cadet? bestTentpegger;
  final Cadet? bestSwimmer;
  final Cadet? bestShooter;
  final Cadet? bestQari;
  final Cadet? bestDebatorUrdu;
  final Cadet? bestDebatorEnglish;
  final Cadet? bestEssayWriterUrdu;
  final Cadet? bestEssayWriterEnglish;
  final Cadet? bestArtist;

  Entry({
    required this.name,
    required this.number,
    required this.strength,
    required this.startDate,
    required this.endDate,
    this.title,
    this.slogan,
    this.houseCommanders,
    this.seniorSectionCommanders,
    this.sectionCommanders,
    this.bestCadet,
    this.bestStudent,
    this.bestSportman,
    this.bestGymnast,
    this.bestDrillCommander,
    this.bestRider,
    this.bestTentpegger,
    this.bestSwimmer,
    this.bestShooter,
    this.bestQari,
    this.bestDebatorUrdu,
    this.bestDebatorEnglish,
    this.bestEssayWriterUrdu,
    this.bestEssayWriterEnglish,
    this.bestArtist,
  });

  Entry copyWith({
    String? name,
    String? number,
    int? strength,
    Timestamp? startDate,
    Timestamp? EndDate,
    String? title,
    String? slogan,
    List<Cadet>? houseCommanders,
    List<Cadet>? seniorSectionCommanders,
    List<Cadet>? sectionCommanders,
    Cadet? bestCadet,
    Cadet? bestStudent,
    Cadet? bestSportman,
    Cadet? bestGymnast,
    Cadet? bestDrillCommander,
    Cadet? bestRider,
    Cadet? bestTentpegger,
    Cadet? bestSwimmer,
    Cadet? bestShooter,
    Cadet? bestQari,
    Cadet? bestDebatorUrdu,
    Cadet? bestDebatorEnglish,
    Cadet? bestEssayWriterUrdu,
    Cadet? bestEssayWriterEnglish,
    Cadet? bestArtist,
  }) {
    return Entry(
      name: name ?? this.name,
      number: number ?? this.number,
      strength: strength ?? this.strength,
      startDate: startDate ?? this.startDate,
      endDate: EndDate ?? this.endDate,
      title: title ?? this.title,
      slogan: slogan ?? this.slogan,
      houseCommanders: houseCommanders ?? this.houseCommanders,
      seniorSectionCommanders:
          seniorSectionCommanders ?? this.seniorSectionCommanders,
      sectionCommanders: sectionCommanders ?? this.sectionCommanders,
      bestCadet: bestCadet ?? this.bestCadet,
      bestStudent: bestStudent ?? this.bestStudent,
      bestSportman: bestSportman ?? this.bestSportman,
      bestGymnast: bestGymnast ?? this.bestGymnast,
      bestDrillCommander: bestDrillCommander ?? this.bestDrillCommander,
      bestRider: bestRider ?? this.bestRider,
      bestTentpegger: bestTentpegger ?? this.bestTentpegger,
      bestSwimmer: bestSwimmer ?? this.bestSwimmer,
      bestShooter: bestShooter ?? this.bestShooter,
      bestQari: bestQari ?? this.bestQari,
      bestDebatorUrdu: bestDebatorUrdu ?? this.bestDebatorUrdu,
      bestDebatorEnglish: bestDebatorEnglish ?? this.bestDebatorEnglish,
      bestEssayWriterUrdu: bestEssayWriterUrdu ?? this.bestEssayWriterUrdu,
      bestEssayWriterEnglish:
          bestEssayWriterEnglish ?? this.bestEssayWriterEnglish,
      bestArtist: bestArtist ?? this.bestArtist,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'number': number});
    result.addAll({'strength': strength});
    result.addAll({'startDate': startDate});
    result.addAll({'EndDate': endDate});
    if (title != null) {
      result.addAll({'title': title});
    }
    if (slogan != null) {
      result.addAll({'slogan': slogan});
    }
    if (houseCommanders != null && houseCommanders!.isNotEmpty) {
      result.addAll(
          {'houseCommanders': houseCommanders!.map((e) => e.toMap()).toList()});
    }
    if (seniorSectionCommanders != null &&
        seniorSectionCommanders!.isNotEmpty) {
      result.addAll({
        'seniorSectionCommanders':
            seniorSectionCommanders!.map((e) => e.toMap()).toList()
      });
    }
    if (sectionCommanders != null && sectionCommanders!.isNotEmpty) {
      result.addAll({
        'sectionCommanders': sectionCommanders!.map((e) => e.toMap()).toList()
      });
    }
    if (bestCadet != null) {
      result.addAll({'bestCadet': bestCadet!.toMap()});
    }
    if (bestStudent != null) {
      result.addAll({'bestStudent': bestStudent!.toMap()});
    }
    if (bestSportman != null) {
      result.addAll({'bestSportman': bestSportman!.toMap()});
    }
    if (bestGymnast != null) {
      result.addAll({'bestGymnast': bestGymnast!.toMap()});
    }
    if (bestDrillCommander != null) {
      result.addAll({'bestDrillCommander': bestDrillCommander!.toMap()});
    }
    if (bestRider != null) {
      result.addAll({'bestRider': bestRider!.toMap()});
    }
    if (bestTentpegger != null) {
      result.addAll({'bestTentpegger': bestTentpegger!.toMap()});
    }
    if (bestSwimmer != null) {
      result.addAll({'bestSwimmer': bestSwimmer!.toMap()});
    }
    if (bestShooter != null) {
      result.addAll({'bestShooter': bestShooter!.toMap()});
    }
    if (bestQari != null) {
      result.addAll({'bestQari': bestQari!.toMap()});
    }
    if (bestDebatorUrdu != null) {
      result.addAll({'bestDebatorUrdu': bestDebatorUrdu!.toMap()});
    }
    if (bestDebatorEnglish != null) {
      result.addAll({'bestDebatorEnglish': bestDebatorEnglish!.toMap()});
    }
    if (bestEssayWriterUrdu != null) {
      result.addAll({'bestEssayWriterUrdu': bestEssayWriterUrdu!.toMap()});
    }
    if (bestEssayWriterEnglish != null) {
      result
          .addAll({'bestEssayWriterEnglish': bestEssayWriterEnglish!.toMap()});
    }
    if (bestArtist != null) {
      result.addAll({'bestArtist': bestArtist!.toMap()});
    }

    return result;
  }

  factory Entry.fromMap(Map<String, dynamic> map) {
    Entry entry = Entry(
      name: map['name'] ?? '',
      number: map['number'] ?? '',
      strength: map['strength']?.toInt() ?? 0,
      startDate: map['startDate'] != null
          ? map['startDate'] as Timestamp
          : Timestamp.now(), // Set to current time if null
      endDate: map['endDate'] != null
          ? map['endDate'] as Timestamp
          : Timestamp.now(), // Set to current time if null
      title: map['title'] ?? '',
      slogan: map['slogan'] ?? '',
     houseCommanders: map.containsKey('houseCommanders')
          ? (map['houseCommanders'] as List)
              .map((e) => Cadet.fromMap(e))
              .toList()
          : [], // Initialize as an empty list if the key is missing

      seniorSectionCommanders: map.containsKey('seniorSectionCommanders')
          ? (map['seniorSectionCommanders'] as List)
              .map((e) => Cadet.fromMap(e))
              .toList()
          : [], // Initialize as an empty list if the key is missing

      sectionCommanders: map.containsKey('sectionCommanders')
          ? (map['sectionCommanders'] as List)
              .map((e) => Cadet.fromMap(e))
              .toList()
          : [], // Initialize as an empty list if the key is missing
      bestCadet:
          map['bestCadet'] != null ? Cadet.fromMap(map['bestCadet']) : null,
      bestStudent:
          map['bestStudent'] != null ? Cadet.fromMap(map['bestStudent']) : null,
      bestSportman: map['bestSportman'] != null
          ? Cadet.fromMap(map['bestSportman'])
          : null,
      bestGymnast:
          map['bestGymnast'] != null ? Cadet.fromMap(map['bestGymnast']) : null,
      bestDrillCommander: map['bestDrillCommander'] != null
          ? Cadet.fromMap(map['bestDrillCommander'])
          : null,
      bestRider:
          map['bestRider'] != null ? Cadet.fromMap(map['bestRider']) : null,
      bestTentpegger: map['bestTentpegger'] != null
          ? Cadet.fromMap(map['bestTentpegger'])
          : null,
      bestSwimmer:
          map['bestSwimmer'] != null ? Cadet.fromMap(map['bestSwimmer']) : null,
      bestShooter:
          map['bestShooter'] != null ? Cadet.fromMap(map['bestShooter']) : null,
      bestQari: map['bestQari'] != null ? Cadet.fromMap(map['bestQari']) : null,
      bestDebatorUrdu: map['bestDebatorUrdu'] != null
          ? Cadet.fromMap(map['bestDebatorUrdu'])
          : null,
      bestDebatorEnglish: map['bestDebatorEnglish'] != null
          ? Cadet.fromMap(map['bestDebatorEnglish'])
          : null,
      bestEssayWriterUrdu: map['bestEssayWriterUrdu'] != null
          ? Cadet.fromMap(map['bestEssayWriterUrdu'])
          : null,
      bestEssayWriterEnglish: map['bestEssayWriterEnglish'] != null
          ? Cadet.fromMap(map['bestEssayWriterEnglish'])
          : null,
      bestArtist:
          map['bestArtist'] != null ? Cadet.fromMap(map['bestArtist']) : null,
    );
    return entry;
  }

  String toJson() => json.encode(toMap());

  factory Entry.fromJson(String source) => Entry.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Entry(name: $name, number: $number, strength: $strength, startDate: $startDate, EndDate: $endDate, title: $title, slogan: $slogan, bestCadet: $bestCadet, bestStudent: $bestStudent, bestSportman: $bestSportman, bestGymnast: $bestGymnast, bestDrillCommander: $bestDrillCommander, bestRider: $bestRider, bestTentpegger: $bestTentpegger, bestSwimmer: $bestSwimmer, bestShooter: $bestShooter, bestQari: $bestQari, bestDebatorUrdu: $bestDebatorUrdu, bestDebatorEnglish: $bestDebatorEnglish, bestEssayWriterUrdu: $bestEssayWriterUrdu, bestEssayWriterEnglish: $bestEssayWriterEnglish, bestArtist: $bestArtist)';
  }

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is Entry &&
  //       other.name == name &&
  //       other.number == number &&
  //       other.strength == strength &&
  //       other.startDate == startDate &&
  //       other.endDate == endDate &&
  //       other.title == title &&
  //       other.slogan == slogan &&
  //       other.bestCadet == bestCadet &&
  //       other.bestStudent == bestStudent &&
  //       other.bestSportman == bestSportman &&
  //       other.bestGymnast == bestGymnast &&
  //       other.bestDrillCommander == bestDrillCommander &&
  //       other.bestRider == bestRider &&
  //       other.bestTentpegger == bestTentpegger &&
  //       other.bestSwimmer == bestSwimmer &&
  //       other.bestShooter == bestShooter &&
  //       other.bestQari == bestQari &&
  //       other.bestDebatorUrdu == bestDebatorUrdu &&
  //       other.bestDebatorEnglish == bestDebatorEnglish &&
  //       other.bestEssayWriterUrdu == bestEssayWriterUrdu &&
  //       other.bestEssayWriterEnglish == bestEssayWriterEnglish &&
  //       other.bestArtist == bestArtist;
  // }

  // @override
  // int get hashCode {
  //   return name.hashCode ^
  //       number.hashCode ^
  //       strength.hashCode ^
  //       startDate.hashCode ^
  //       endDate.hashCode ^
  //       title.hashCode ^
  //       slogan.hashCode ^
  //       bestCadet.hashCode ^
  //       bestStudent.hashCode ^
  //       bestSportman.hashCode ^
  //       bestGymnast.hashCode ^
  //       bestDrillCommander.hashCode ^
  //       bestRider.hashCode ^
  //       bestTentpegger.hashCode ^
  //       bestSwimmer.hashCode ^
  //       bestShooter.hashCode ^
  //       bestQari.hashCode ^
  //       bestDebatorUrdu.hashCode ^
  //       bestDebatorEnglish.hashCode ^
  //       bestEssayWriterUrdu.hashCode ^
  //       bestEssayWriterEnglish.hashCode ^
  //       bestArtist.hashCode;
  // }

  @override
  List<Object?> get props => [
        name,
        number,
        strength,
        startDate,
        endDate,
        title,
        slogan,
        bestCadet,
        bestStudent,
        bestSportman,
        bestGymnast,
        bestDrillCommander,
        bestRider,
        bestTentpegger,
        bestSwimmer,
        bestShooter,
        bestQari,
        bestDebatorUrdu,
        bestDebatorEnglish,
        bestEssayWriterUrdu,
        bestEssayWriterEnglish,
        bestArtist
      ];
}
