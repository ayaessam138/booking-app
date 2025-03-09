// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventsEntityAdapter extends TypeAdapter<EventsEntity> {
  @override
  final int typeId = 0;

  @override
  EventsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventsEntity(
      eventId: fields[0] as int,
      picture: fields[1] as String,
      date: fields[2] as String,
      title: fields[3] as String,
      address: fields[4] as String,
      numberOfGoing: fields[5] as int,
      organizer: fields[6] as OrganizerEntity,
    );
  }

  @override
  void write(BinaryWriter writer, EventsEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.eventId)
      ..writeByte(1)
      ..write(obj.picture)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.numberOfGoing)
      ..writeByte(6)
      ..write(obj.organizer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrganizerEntityAdapter extends TypeAdapter<OrganizerEntity> {
  @override
  final int typeId = 1;

  @override
  OrganizerEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrganizerEntity(
      id: fields[0] as int,
      name: fields[1] as String,
      picture: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OrganizerEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.picture);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrganizerEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
