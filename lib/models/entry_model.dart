import 'dart:convert';

import 'package:kohatian_foundation/widget_export.dart';

class Entry {
  final String name;
  final int strength;
  final DateTime startDate;
  final DateTime EndDate;
  final String? title;
  final String? slogan;
  final List<Cadet> houseCommanders = [];
  final List<Cadet> seniorSectionCommanders = [];
  final List<Cadet> sectionCommanders = [];
//entry title winners
  Cadet bestCadet;
  Cadet bestStudent;
  Cadet bestSportman;
  Cadet bestGymnast;
  Cadet bestDrillCommander;
  Cadet bestRider;
  Cadet bestTentpegger;
  Cadet? bestSwimmer;
  Cadet? bestShooter;
  Cadet? bestQari;
  Cadet? bestDebatorUrdu;
  Cadet? bestDebatorEnglish;
  Cadet? bestEssayWriterUrdu;
  Cadet? bestEssayWriterEnglish;
  Cadet? bestArtist;
  
  Entry({
    required this.name,
    required this.strength,
    required this.startDate,
    required this.EndDate,
    this.title,
    this.slogan,
    required this.bestCadet,
    required this.bestStudent,
    required this.bestSportman,
    required this.bestGymnast,
    required this.bestDrillCommander,
    required this.bestRider,
    required this.bestTentpegger,
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
    int? strength,
    DateTime? startDate,
    DateTime? EndDate,
    String? title,
    String? slogan,
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
      strength: strength ?? this.strength,
      startDate: startDate ?? this.startDate,
      EndDate: EndDate ?? this.EndDate,
      title: title ?? this.title,
      slogan: slogan ?? this.slogan,
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
      bestEssayWriterEnglish: bestEssayWriterEnglish ?? this.bestEssayWriterEnglish,
      bestArtist: bestArtist ?? this.bestArtist,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'strength': strength});
    result.addAll({'startDate': startDate.millisecondsSinceEpoch});
    result.addAll({'EndDate': EndDate.millisecondsSinceEpoch});
    if(title != null){
      result.addAll({'title': title});
    }
    if(slogan != null){
      result.addAll({'slogan': slogan});
    }
    result.addAll({'bestCadet': bestCadet.toMap()});
    result.addAll({'bestStudent': bestStudent.toMap()});
    result.addAll({'bestSportman': bestSportman.toMap()});
    result.addAll({'bestGymnast': bestGymnast.toMap()});
    result.addAll({'bestDrillCommander': bestDrillCommander.toMap()});
    result.addAll({'bestRider': bestRider.toMap()});
    result.addAll({'bestTentpegger': bestTentpegger.toMap()});
    if(bestSwimmer != null){
      result.addAll({'bestSwimmer': bestSwimmer!.toMap()});
    }
    if(bestShooter != null){
      result.addAll({'bestShooter': bestShooter!.toMap()});
    }
    if(bestQari != null){
      result.addAll({'bestQari': bestQari!.toMap()});
    }
    if(bestDebatorUrdu != null){
      result.addAll({'bestDebatorUrdu': bestDebatorUrdu!.toMap()});
    }
    if(bestDebatorEnglish != null){
      result.addAll({'bestDebatorEnglish': bestDebatorEnglish!.toMap()});
    }
    if(bestEssayWriterUrdu != null){
      result.addAll({'bestEssayWriterUrdu': bestEssayWriterUrdu!.toMap()});
    }
    if(bestEssayWriterEnglish != null){
      result.addAll({'bestEssayWriterEnglish': bestEssayWriterEnglish!.toMap()});
    }
    if(bestArtist != null){
      result.addAll({'bestArtist': bestArtist!.toMap()});
    }
  
    return result;
  }

  factory Entry.fromMap(Map<String, dynamic> map) {
    return Entry(
      name: map['name'] ?? '',
      strength: map['strength']?.toInt() ?? 0,
      startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate']),
      EndDate: DateTime.fromMillisecondsSinceEpoch(map['EndDate']),
      title: map['title'],
      slogan: map['slogan'],
      bestCadet: Cadet.fromMap(map['bestCadet']),
      bestStudent: Cadet.fromMap(map['bestStudent']),
      bestSportman: Cadet.fromMap(map['bestSportman']),
      bestGymnast: Cadet.fromMap(map['bestGymnast']),
      bestDrillCommander: Cadet.fromMap(map['bestDrillCommander']),
      bestRider: Cadet.fromMap(map['bestRider']),
      bestTentpegger: Cadet.fromMap(map['bestTentpegger']),
      bestSwimmer: map['bestSwimmer'] != null ? Cadet.fromMap(map['bestSwimmer']) : null,
      bestShooter: map['bestShooter'] != null ? Cadet.fromMap(map['bestShooter']) : null,
      bestQari: map['bestQari'] != null ? Cadet.fromMap(map['bestQari']) : null,
      bestDebatorUrdu: map['bestDebatorUrdu'] != null ? Cadet.fromMap(map['bestDebatorUrdu']) : null,
      bestDebatorEnglish: map['bestDebatorEnglish'] != null ? Cadet.fromMap(map['bestDebatorEnglish']) : null,
      bestEssayWriterUrdu: map['bestEssayWriterUrdu'] != null ? Cadet.fromMap(map['bestEssayWriterUrdu']) : null,
      bestEssayWriterEnglish: map['bestEssayWriterEnglish'] != null ? Cadet.fromMap(map['bestEssayWriterEnglish']) : null,
      bestArtist: map['bestArtist'] != null ? Cadet.fromMap(map['bestArtist']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Entry.fromJson(String source) => Entry.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Entry(name: $name, strength: $strength, startDate: $startDate, EndDate: $EndDate, title: $title, slogan: $slogan, bestCadet: $bestCadet, bestStudent: $bestStudent, bestSportman: $bestSportman, bestGymnast: $bestGymnast, bestDrillCommander: $bestDrillCommander, bestRider: $bestRider, bestTentpegger: $bestTentpegger, bestSwimmer: $bestSwimmer, bestShooter: $bestShooter, bestQari: $bestQari, bestDebatorUrdu: $bestDebatorUrdu, bestDebatorEnglish: $bestDebatorEnglish, bestEssayWriterUrdu: $bestEssayWriterUrdu, bestEssayWriterEnglish: $bestEssayWriterEnglish, bestArtist: $bestArtist)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Entry &&
      other.name == name &&
      other.strength == strength &&
      other.startDate == startDate &&
      other.EndDate == EndDate &&
      other.title == title &&
      other.slogan == slogan &&
      other.bestCadet == bestCadet &&
      other.bestStudent == bestStudent &&
      other.bestSportman == bestSportman &&
      other.bestGymnast == bestGymnast &&
      other.bestDrillCommander == bestDrillCommander &&
      other.bestRider == bestRider &&
      other.bestTentpegger == bestTentpegger &&
      other.bestSwimmer == bestSwimmer &&
      other.bestShooter == bestShooter &&
      other.bestQari == bestQari &&
      other.bestDebatorUrdu == bestDebatorUrdu &&
      other.bestDebatorEnglish == bestDebatorEnglish &&
      other.bestEssayWriterUrdu == bestEssayWriterUrdu &&
      other.bestEssayWriterEnglish == bestEssayWriterEnglish &&
      other.bestArtist == bestArtist;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      strength.hashCode ^
      startDate.hashCode ^
      EndDate.hashCode ^
      title.hashCode ^
      slogan.hashCode ^
      bestCadet.hashCode ^
      bestStudent.hashCode ^
      bestSportman.hashCode ^
      bestGymnast.hashCode ^
      bestDrillCommander.hashCode ^
      bestRider.hashCode ^
      bestTentpegger.hashCode ^
      bestSwimmer.hashCode ^
      bestShooter.hashCode ^
      bestQari.hashCode ^
      bestDebatorUrdu.hashCode ^
      bestDebatorEnglish.hashCode ^
      bestEssayWriterUrdu.hashCode ^
      bestEssayWriterEnglish.hashCode ^
      bestArtist.hashCode;
  }


}
