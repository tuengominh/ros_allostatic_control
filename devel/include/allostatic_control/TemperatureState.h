// Generated by gencpp from file allostatic_control/TemperatureState.msg
// DO NOT EDIT!


#ifndef ALLOSTATIC_CONTROL_MESSAGE_TEMPERATURESTATE_H
#define ALLOSTATIC_CONTROL_MESSAGE_TEMPERATURESTATE_H


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
struct TemperatureState_
{
  typedef TemperatureState_<ContainerAllocator> Type;

  TemperatureState_()
    : temp_aV(0.0)
    , temp_urgency(0.0)
    , adsign(0.0)
    , hsign(0.0)  {
    }
  TemperatureState_(const ContainerAllocator& _alloc)
    : temp_aV(0.0)
    , temp_urgency(0.0)
    , adsign(0.0)
    , hsign(0.0)  {
  (void)_alloc;
    }



   typedef float _temp_aV_type;
  _temp_aV_type temp_aV;

   typedef float _temp_urgency_type;
  _temp_urgency_type temp_urgency;

   typedef float _adsign_type;
  _adsign_type adsign;

   typedef float _hsign_type;
  _hsign_type hsign;





  typedef boost::shared_ptr< ::allostatic_control::TemperatureState_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::allostatic_control::TemperatureState_<ContainerAllocator> const> ConstPtr;

}; // struct TemperatureState_

typedef ::allostatic_control::TemperatureState_<std::allocator<void> > TemperatureState;

typedef boost::shared_ptr< ::allostatic_control::TemperatureState > TemperatureStatePtr;
typedef boost::shared_ptr< ::allostatic_control::TemperatureState const> TemperatureStateConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::allostatic_control::TemperatureState_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::allostatic_control::TemperatureState_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::allostatic_control::TemperatureState_<ContainerAllocator1> & lhs, const ::allostatic_control::TemperatureState_<ContainerAllocator2> & rhs)
{
  return lhs.temp_aV == rhs.temp_aV &&
    lhs.temp_urgency == rhs.temp_urgency &&
    lhs.adsign == rhs.adsign &&
    lhs.hsign == rhs.hsign;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::allostatic_control::TemperatureState_<ContainerAllocator1> & lhs, const ::allostatic_control::TemperatureState_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace allostatic_control

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::allostatic_control::TemperatureState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::allostatic_control::TemperatureState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::allostatic_control::TemperatureState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::allostatic_control::TemperatureState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::allostatic_control::TemperatureState_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::allostatic_control::TemperatureState_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::allostatic_control::TemperatureState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a5757ceae5e52b647c58e39dc62225c3";
  }

  static const char* value(const ::allostatic_control::TemperatureState_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa5757ceae5e52b64ULL;
  static const uint64_t static_value2 = 0x7c58e39dc62225c3ULL;
};

template<class ContainerAllocator>
struct DataType< ::allostatic_control::TemperatureState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "allostatic_control/TemperatureState";
  }

  static const char* value(const ::allostatic_control::TemperatureState_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::allostatic_control::TemperatureState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 temp_aV\n"
"float32 temp_urgency\n"
"float32 adsign\n"
"float32 hsign\n"
;
  }

  static const char* value(const ::allostatic_control::TemperatureState_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::allostatic_control::TemperatureState_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.temp_aV);
      stream.next(m.temp_urgency);
      stream.next(m.adsign);
      stream.next(m.hsign);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TemperatureState_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::allostatic_control::TemperatureState_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::allostatic_control::TemperatureState_<ContainerAllocator>& v)
  {
    s << indent << "temp_aV: ";
    Printer<float>::stream(s, indent + "  ", v.temp_aV);
    s << indent << "temp_urgency: ";
    Printer<float>::stream(s, indent + "  ", v.temp_urgency);
    s << indent << "adsign: ";
    Printer<float>::stream(s, indent + "  ", v.adsign);
    s << indent << "hsign: ";
    Printer<float>::stream(s, indent + "  ", v.hsign);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ALLOSTATIC_CONTROL_MESSAGE_TEMPERATURESTATE_H