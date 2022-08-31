# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from allostatic_control/Blob.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class Blob(genpy.Message):
  _md5sum = "3395f1fd9ae656e6b4bded8b2c6ac06b"
  _type = "allostatic_control/Blob"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """bool Target
float32 Target_x
string Target_color
bool R_obstacle
bool L_obstacle
float32 R_obstacle_dist
float32 L_obstacle_dist
float32 num_food
float32 num_water
"""
  __slots__ = ['Target','Target_x','Target_color','R_obstacle','L_obstacle','R_obstacle_dist','L_obstacle_dist','num_food','num_water']
  _slot_types = ['bool','float32','string','bool','bool','float32','float32','float32','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       Target,Target_x,Target_color,R_obstacle,L_obstacle,R_obstacle_dist,L_obstacle_dist,num_food,num_water

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Blob, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.Target is None:
        self.Target = False
      if self.Target_x is None:
        self.Target_x = 0.
      if self.Target_color is None:
        self.Target_color = ''
      if self.R_obstacle is None:
        self.R_obstacle = False
      if self.L_obstacle is None:
        self.L_obstacle = False
      if self.R_obstacle_dist is None:
        self.R_obstacle_dist = 0.
      if self.L_obstacle_dist is None:
        self.L_obstacle_dist = 0.
      if self.num_food is None:
        self.num_food = 0.
      if self.num_water is None:
        self.num_water = 0.
    else:
      self.Target = False
      self.Target_x = 0.
      self.Target_color = ''
      self.R_obstacle = False
      self.L_obstacle = False
      self.R_obstacle_dist = 0.
      self.L_obstacle_dist = 0.
      self.num_food = 0.
      self.num_water = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_Bf().pack(_x.Target, _x.Target_x))
      _x = self.Target_color
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_2B4f().pack(_x.R_obstacle, _x.L_obstacle, _x.R_obstacle_dist, _x.L_obstacle_dist, _x.num_food, _x.num_water))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 5
      (_x.Target, _x.Target_x,) = _get_struct_Bf().unpack(str[start:end])
      self.Target = bool(self.Target)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.Target_color = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.Target_color = str[start:end]
      _x = self
      start = end
      end += 18
      (_x.R_obstacle, _x.L_obstacle, _x.R_obstacle_dist, _x.L_obstacle_dist, _x.num_food, _x.num_water,) = _get_struct_2B4f().unpack(str[start:end])
      self.R_obstacle = bool(self.R_obstacle)
      self.L_obstacle = bool(self.L_obstacle)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_Bf().pack(_x.Target, _x.Target_x))
      _x = self.Target_color
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_2B4f().pack(_x.R_obstacle, _x.L_obstacle, _x.R_obstacle_dist, _x.L_obstacle_dist, _x.num_food, _x.num_water))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 5
      (_x.Target, _x.Target_x,) = _get_struct_Bf().unpack(str[start:end])
      self.Target = bool(self.Target)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.Target_color = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.Target_color = str[start:end]
      _x = self
      start = end
      end += 18
      (_x.R_obstacle, _x.L_obstacle, _x.R_obstacle_dist, _x.L_obstacle_dist, _x.num_food, _x.num_water,) = _get_struct_2B4f().unpack(str[start:end])
      self.R_obstacle = bool(self.R_obstacle)
      self.L_obstacle = bool(self.L_obstacle)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2B4f = None
def _get_struct_2B4f():
    global _struct_2B4f
    if _struct_2B4f is None:
        _struct_2B4f = struct.Struct("<2B4f")
    return _struct_2B4f
_struct_Bf = None
def _get_struct_Bf():
    global _struct_Bf
    if _struct_Bf is None:
        _struct_Bf = struct.Struct("<Bf")
    return _struct_Bf