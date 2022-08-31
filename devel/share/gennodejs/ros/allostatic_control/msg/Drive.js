// Auto-generated. Do not edit!

// (in-package allostatic_control.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Drive {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.hunger_drive = null;
      this.thirst_drive = null;
      this.temp_drive = null;
      this.adsign = null;
      this.hsign = null;
    }
    else {
      if (initObj.hasOwnProperty('hunger_drive')) {
        this.hunger_drive = initObj.hunger_drive
      }
      else {
        this.hunger_drive = 0.0;
      }
      if (initObj.hasOwnProperty('thirst_drive')) {
        this.thirst_drive = initObj.thirst_drive
      }
      else {
        this.thirst_drive = 0.0;
      }
      if (initObj.hasOwnProperty('temp_drive')) {
        this.temp_drive = initObj.temp_drive
      }
      else {
        this.temp_drive = 0.0;
      }
      if (initObj.hasOwnProperty('adsign')) {
        this.adsign = initObj.adsign
      }
      else {
        this.adsign = 0.0;
      }
      if (initObj.hasOwnProperty('hsign')) {
        this.hsign = initObj.hsign
      }
      else {
        this.hsign = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Drive
    // Serialize message field [hunger_drive]
    bufferOffset = _serializer.float32(obj.hunger_drive, buffer, bufferOffset);
    // Serialize message field [thirst_drive]
    bufferOffset = _serializer.float32(obj.thirst_drive, buffer, bufferOffset);
    // Serialize message field [temp_drive]
    bufferOffset = _serializer.float32(obj.temp_drive, buffer, bufferOffset);
    // Serialize message field [adsign]
    bufferOffset = _serializer.float32(obj.adsign, buffer, bufferOffset);
    // Serialize message field [hsign]
    bufferOffset = _serializer.float32(obj.hsign, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Drive
    let len;
    let data = new Drive(null);
    // Deserialize message field [hunger_drive]
    data.hunger_drive = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [thirst_drive]
    data.thirst_drive = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [temp_drive]
    data.temp_drive = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [adsign]
    data.adsign = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [hsign]
    data.hsign = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'allostatic_control/Drive';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e4b100e18918e1da885417627a4aa817';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 hunger_drive
    float32 thirst_drive
    float32 temp_drive
    float32 adsign
    float32 hsign
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Drive(null);
    if (msg.hunger_drive !== undefined) {
      resolved.hunger_drive = msg.hunger_drive;
    }
    else {
      resolved.hunger_drive = 0.0
    }

    if (msg.thirst_drive !== undefined) {
      resolved.thirst_drive = msg.thirst_drive;
    }
    else {
      resolved.thirst_drive = 0.0
    }

    if (msg.temp_drive !== undefined) {
      resolved.temp_drive = msg.temp_drive;
    }
    else {
      resolved.temp_drive = 0.0
    }

    if (msg.adsign !== undefined) {
      resolved.adsign = msg.adsign;
    }
    else {
      resolved.adsign = 0.0
    }

    if (msg.hsign !== undefined) {
      resolved.hsign = msg.hsign;
    }
    else {
      resolved.hsign = 0.0
    }

    return resolved;
    }
};

module.exports = Drive;
