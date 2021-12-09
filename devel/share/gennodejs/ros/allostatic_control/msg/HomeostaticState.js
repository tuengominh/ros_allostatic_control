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

class HomeostaticState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.energy_aV = null;
      this.water_aV = null;
      this.temp_aV = null;
      this.hunger_urgency = null;
      this.thirst_urgency = null;
      this.temp_urgency = null;
      this.adsign = null;
      this.hsign = null;
    }
    else {
      if (initObj.hasOwnProperty('energy_aV')) {
        this.energy_aV = initObj.energy_aV
      }
      else {
        this.energy_aV = 0.0;
      }
      if (initObj.hasOwnProperty('water_aV')) {
        this.water_aV = initObj.water_aV
      }
      else {
        this.water_aV = 0.0;
      }
      if (initObj.hasOwnProperty('temp_aV')) {
        this.temp_aV = initObj.temp_aV
      }
      else {
        this.temp_aV = 0.0;
      }
      if (initObj.hasOwnProperty('hunger_urgency')) {
        this.hunger_urgency = initObj.hunger_urgency
      }
      else {
        this.hunger_urgency = 0.0;
      }
      if (initObj.hasOwnProperty('thirst_urgency')) {
        this.thirst_urgency = initObj.thirst_urgency
      }
      else {
        this.thirst_urgency = 0.0;
      }
      if (initObj.hasOwnProperty('temp_urgency')) {
        this.temp_urgency = initObj.temp_urgency
      }
      else {
        this.temp_urgency = 0.0;
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
    // Serializes a message object of type HomeostaticState
    // Serialize message field [energy_aV]
    bufferOffset = _serializer.float32(obj.energy_aV, buffer, bufferOffset);
    // Serialize message field [water_aV]
    bufferOffset = _serializer.float32(obj.water_aV, buffer, bufferOffset);
    // Serialize message field [temp_aV]
    bufferOffset = _serializer.float32(obj.temp_aV, buffer, bufferOffset);
    // Serialize message field [hunger_urgency]
    bufferOffset = _serializer.float32(obj.hunger_urgency, buffer, bufferOffset);
    // Serialize message field [thirst_urgency]
    bufferOffset = _serializer.float32(obj.thirst_urgency, buffer, bufferOffset);
    // Serialize message field [temp_urgency]
    bufferOffset = _serializer.float32(obj.temp_urgency, buffer, bufferOffset);
    // Serialize message field [adsign]
    bufferOffset = _serializer.float32(obj.adsign, buffer, bufferOffset);
    // Serialize message field [hsign]
    bufferOffset = _serializer.float32(obj.hsign, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type HomeostaticState
    let len;
    let data = new HomeostaticState(null);
    // Deserialize message field [energy_aV]
    data.energy_aV = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [water_aV]
    data.water_aV = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [temp_aV]
    data.temp_aV = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [hunger_urgency]
    data.hunger_urgency = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [thirst_urgency]
    data.thirst_urgency = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [temp_urgency]
    data.temp_urgency = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [adsign]
    data.adsign = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [hsign]
    data.hsign = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'allostatic_control/HomeostaticState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4a099a68a501f1e47aa53247b3024fb7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 energy_aV
    float32 water_aV
    float32 temp_aV
    float32 hunger_urgency
    float32 thirst_urgency
    float32 temp_urgency
    float32 adsign
    float32 hsign
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new HomeostaticState(null);
    if (msg.energy_aV !== undefined) {
      resolved.energy_aV = msg.energy_aV;
    }
    else {
      resolved.energy_aV = 0.0
    }

    if (msg.water_aV !== undefined) {
      resolved.water_aV = msg.water_aV;
    }
    else {
      resolved.water_aV = 0.0
    }

    if (msg.temp_aV !== undefined) {
      resolved.temp_aV = msg.temp_aV;
    }
    else {
      resolved.temp_aV = 0.0
    }

    if (msg.hunger_urgency !== undefined) {
      resolved.hunger_urgency = msg.hunger_urgency;
    }
    else {
      resolved.hunger_urgency = 0.0
    }

    if (msg.thirst_urgency !== undefined) {
      resolved.thirst_urgency = msg.thirst_urgency;
    }
    else {
      resolved.thirst_urgency = 0.0
    }

    if (msg.temp_urgency !== undefined) {
      resolved.temp_urgency = msg.temp_urgency;
    }
    else {
      resolved.temp_urgency = 0.0
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

module.exports = HomeostaticState;
