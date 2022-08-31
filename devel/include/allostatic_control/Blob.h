// Generated by gencpp from file allostatic_control/Blob.msg
// DO NOT EDIT!


#ifndef ALLOSTATIC_CONTROL_MESSAGE_BLOB_H
#define ALLOSTATIC_CONTROL_MESSAGE_BLOB_H


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
struct Blob_
{
  typedef Blob_<ContainerAllocator> Type;

  Blob_()
    : Target(false)
    , Target_x(0.0)
    , Target_color()
    , R_obstacle(false)
    , L_obstacle(false)
    , R_obstacle_dist(0.0)
    , L_obstacle_dist(0.0)
    , num_food(0.0)
    , num_water(0.0)  {
    }
  Blob_(const ContainerAllocator& _alloc)
    : Target(false)
    , Target_x(0.0)
    , Target_color(_alloc)
    , R_obstacle(false)
    , L_obstacle(false)
    , R_obstacle_dist(0.0)
    , L_obstacle_dist(0.0)
    , num_food(0.0)
    , num_water(0.0)  {
  (void)_alloc;
    }



   typedef uint8_t _Target_type;
  _Target_type Target;

   typedef float _Target_x_type;
  _Target_x_type Target_x;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _Target_color_type;
  _Target_color_type Target_color;

   typedef uint8_t _R_obstacle_type;
  _R_obstacle_type R_obstacle;

   typedef uint8_t _L_obstacle_type;
  _L_obstacle_type L_obstacle;

   typedef float _R_obstacle_dist_type;
  _R_obstacle_dist_type R_obstacle_dist;

   typedef float _L_obstacle_dist_type;
  _L_obstacle_dist_type L_obstacle_dist;

   typedef float _num_food_type;
  _num_food_type num_food;

   typedef float _num_water_type;
  _num_water_type num_water;





  typedef boost::shared_ptr< ::allostatic_control::Blob_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::allostatic_control::Blob_<ContainerAllocator> const> ConstPtr;

}; // struct Blob_

typedef ::allostatic_control::Blob_<std::allocator<void> > Blob;

typedef boost::shared_ptr< ::allostatic_control::Blob > BlobPtr;
typedef boost::shared_ptr< ::allostatic_control::Blob const> BlobConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::allostatic_control::Blob_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::allostatic_control::Blob_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::allostatic_control::Blob_<ContainerAllocator1> & lhs, const ::allostatic_control::Blob_<ContainerAllocator2> & rhs)
{
  return lhs.Target == rhs.Target &&
    lhs.Target_x == rhs.Target_x &&
    lhs.Target_color == rhs.Target_color &&
    lhs.R_obstacle == rhs.R_obstacle &&
    lhs.L_obstacle == rhs.L_obstacle &&
    lhs.R_obstacle_dist == rhs.R_obstacle_dist &&
    lhs.L_obstacle_dist == rhs.L_obstacle_dist &&
    lhs.num_food == rhs.num_food &&
    lhs.num_water == rhs.num_water;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::allostatic_control::Blob_<ContainerAllocator1> & lhs, const ::allostatic_control::Blob_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace allostatic_control

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::allostatic_control::Blob_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::allostatic_control::Blob_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::allostatic_control::Blob_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::allostatic_control::Blob_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::allostatic_control::Blob_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::allostatic_control::Blob_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::allostatic_control::Blob_<ContainerAllocator> >
{
  static const char* value()
  {
    return "3395f1fd9ae656e6b4bded8b2c6ac06b";
  }

  static const char* value(const ::allostatic_control::Blob_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x3395f1fd9ae656e6ULL;
  static const uint64_t static_value2 = 0xb4bded8b2c6ac06bULL;
};

template<class ContainerAllocator>
struct DataType< ::allostatic_control::Blob_<ContainerAllocator> >
{
  static const char* value()
  {
    return "allostatic_control/Blob";
  }

  static const char* value(const ::allostatic_control::Blob_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::allostatic_control::Blob_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool Target\n"
"float32 Target_x\n"
"string Target_color\n"
"bool R_obstacle\n"
"bool L_obstacle\n"
"float32 R_obstacle_dist\n"
"float32 L_obstacle_dist\n"
"float32 num_food\n"
"float32 num_water\n"
;
  }

  static const char* value(const ::allostatic_control::Blob_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::allostatic_control::Blob_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.Target);
      stream.next(m.Target_x);
      stream.next(m.Target_color);
      stream.next(m.R_obstacle);
      stream.next(m.L_obstacle);
      stream.next(m.R_obstacle_dist);
      stream.next(m.L_obstacle_dist);
      stream.next(m.num_food);
      stream.next(m.num_water);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Blob_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::allostatic_control::Blob_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::allostatic_control::Blob_<ContainerAllocator>& v)
  {
    s << indent << "Target: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.Target);
    s << indent << "Target_x: ";
    Printer<float>::stream(s, indent + "  ", v.Target_x);
    s << indent << "Target_color: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.Target_color);
    s << indent << "R_obstacle: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.R_obstacle);
    s << indent << "L_obstacle: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.L_obstacle);
    s << indent << "R_obstacle_dist: ";
    Printer<float>::stream(s, indent + "  ", v.R_obstacle_dist);
    s << indent << "L_obstacle_dist: ";
    Printer<float>::stream(s, indent + "  ", v.L_obstacle_dist);
    s << indent << "num_food: ";
    Printer<float>::stream(s, indent + "  ", v.num_food);
    s << indent << "num_water: ";
    Printer<float>::stream(s, indent + "  ", v.num_water);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ALLOSTATIC_CONTROL_MESSAGE_BLOB_H