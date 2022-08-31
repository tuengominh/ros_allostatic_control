// Generated by gencpp from file allostatic_control/Drive.msg
// DO NOT EDIT!


#ifndef ALLOSTATIC_CONTROL_MESSAGE_DRIVE_H
#define ALLOSTATIC_CONTROL_MESSAGE_DRIVE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace allostatic_control
{
template <class ContainerAllocator>
struct Drive_
{
  typedef Drive_<ContainerAllocator> Type;

  Drive_()
    : hunger_drive(0.0)
    , thirst_drive(0.0)
    , temp_drive(0.0)
    , adsign(0.0)
    , hsign(0.0)  {
    }
  Drive_(const ContainerAllocator& _alloc)
    : hunger_drive(0.0)
    , thirst_drive(0.0)
    , temp_drive(0.0)
    , adsign(0.0)
    , hsign(0.0)  {
  (void)_alloc;
    }



   typedef float _hunger_drive_type;
  _hunger_drive_type hunger_drive;

   typedef float _thirst_drive_type;
  _thirst_drive_type thirst_drive;

   typedef float _temp_drive_type;
  _temp_drive_type temp_drive;

   typedef float _adsign_type;
  _adsign_type adsign;

   typedef float _hsign_type;
  _hsign_type hsign;





  typedef boost::shared_ptr< ::allostatic_control::Drive_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::allostatic_control::Drive_<ContainerAllocator> const> ConstPtr;

}; // struct Drive_

typedef ::allostatic_control::Drive_<std::allocator<void> > Drive;

typedef boost::shared_ptr< ::allostatic_control::Drive > DrivePtr;
typedef boost::shared_ptr< ::allostatic_control::Drive const> DriveConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::allostatic_control::Drive_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::allostatic_control::Drive_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::allostatic_control::Drive_<ContainerAllocator1> & lhs, const ::allostatic_control::Drive_<ContainerAllocator2> & rhs)
{
  return lhs.hunger_drive == rhs.hunger_drive &&
    lhs.thirst_drive == rhs.thirst_drive &&
    lhs.temp_drive == rhs.temp_drive &&
    lhs.adsign == rhs.adsign &&
    lhs.hsign == rhs.hsign;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::allostatic_control::Drive_<ContainerAllocator1> & lhs, const ::allostatic_control::Drive_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace allostatic_control

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::allostatic_control::Drive_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::allostatic_control::Drive_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::allostatic_control::Drive_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::allostatic_control::Drive_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::allostatic_control::Drive_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::allostatic_control::Drive_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::allostatic_control::Drive_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e4b100e18918e1da885417627a4aa817";
  }

  static const char* value(const ::allostatic_control::Drive_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe4b100e18918e1daULL;
  static const uint64_t static_value2 = 0x885417627a4aa817ULL;
};

template<class ContainerAllocator>
struct DataType< ::allostatic_control::Drive_<ContainerAllocator> >
{
  static const char* value()
  {
    return "allostatic_control/Drive";
  }

  static const char* value(const ::allostatic_control::Drive_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::allostatic_control::Drive_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 hunger_drive\n"
"float32 thirst_drive\n"
"float32 temp_drive\n"
"float32 adsign\n"
"float32 hsign\n"
;
  }

  static const char* value(const ::allostatic_control::Drive_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::allostatic_control::Drive_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.hunger_drive);
      stream.next(m.thirst_drive);
      stream.next(m.temp_drive);
      stream.next(m.adsign);
      stream.next(m.hsign);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Drive_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::allostatic_control::Drive_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::allostatic_control::Drive_<ContainerAllocator>& v)
  {
    s << indent << "hunger_drive: ";
    Printer<float>::stream(s, indent + "  ", v.hunger_drive);
    s << indent << "thirst_drive: ";
    Printer<float>::stream(s, indent + "  ", v.thirst_drive);
    s << indent << "temp_drive: ";
    Printer<float>::stream(s, indent + "  ", v.temp_drive);
    s << indent << "adsign: ";
    Printer<float>::stream(s, indent + "  ", v.adsign);
    s << indent << "hsign: ";
    Printer<float>::stream(s, indent + "  ", v.hsign);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ALLOSTATIC_CONTROL_MESSAGE_DRIVE_H