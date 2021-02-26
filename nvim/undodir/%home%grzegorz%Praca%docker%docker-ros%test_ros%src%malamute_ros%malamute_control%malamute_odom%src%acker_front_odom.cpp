Vim�UnDo� �e����ay���a�E�h�"�J� 9�\G   �   F  returns.push_back(_params_nh.getParam("angle_topic", _angle_topic));   X                           `Y�    _�                             ����                                                                                                                                                                                                                                                                                                                                                             `Y�     �      o   �   \   O      _wheel_angular_velocity(0.0), _angle_factor(1.0), _velocity_factor(0.0) {       1  if (_general_params.odom_type != "acker_front")   ?    throw std::runtime_error("Wrong odom type for this class");     if (!loadSpecificParams())   K    throw std::runtime_error("Couldn't load params from parameter server");         registerSubscibers();   }       +void AckerFrontOdom::registerSubscibers() {     switch (_topic_type) {     case TopicType::INT8:   &    _sub_angle = _topics_nh.subscribe(   P        _angle_topic, 10, &AckerFrontOdom::angleCallback<std_msgs::Int8>, this);   )    _sub_velocity = _topics_nh.subscribe(   O        _velocity_topic, 10, &AckerFrontOdom::velocityCallback<std_msgs::Int8>,           this);   
    break;     case TopicType::INT16:   &    _sub_angle = _topics_nh.subscribe(   J        _angle_topic, 10, &AckerFrontOdom::angleCallback<std_msgs::Int16>,           this);   )    _sub_velocity = _topics_nh.subscribe(   P        _velocity_topic, 10, &AckerFrontOdom::velocityCallback<std_msgs::Int16>,           this);   
    break;     case TopicType::INT32:   &    _sub_angle = _topics_nh.subscribe(   J        _angle_topic, 10, &AckerFrontOdom::angleCallback<std_msgs::Int32>,           this);   )    _sub_velocity = _topics_nh.subscribe(   P        _velocity_topic, 10, &AckerFrontOdom::velocityCallback<std_msgs::Int32>,           this);   
    break;     case TopicType::INT64:   &    _sub_angle = _topics_nh.subscribe(   J        _angle_topic, 10, &AckerFrontOdom::angleCallback<std_msgs::Int64>,           this);   )    _sub_velocity = _topics_nh.subscribe(   P        _velocity_topic, 10, &AckerFrontOdom::velocityCallback<std_msgs::Int64>,           this);   
    break;     case TopicType::FLOAT32:   &    _sub_angle = _topics_nh.subscribe(   L        _angle_topic, 10, &AckerFrontOdom::angleCallback<std_msgs::Float32>,           this);   )    _sub_velocity = _topics_nh.subscribe(           _velocity_topic, 10,   D        &AckerFrontOdom::velocityCallback<std_msgs::Float32>, this);   
    break;     case TopicType::FLOAT64:   &    _sub_angle = _topics_nh.subscribe(   L        _angle_topic, 10, &AckerFrontOdom::angleCallback<std_msgs::Float64>,           this);   )    _sub_velocity = _topics_nh.subscribe(           _velocity_topic, 10,   D        &AckerFrontOdom::velocityCallback<std_msgs::Float64>, this);   
    break;   
  default:       throw std::logic_error(   K        "TopicType enum has wrong value, but it should be checked before");     }   }       +bool AckerFrontOdom::loadSpecificParams() {   +  ROS_DEBUG("Loading specific parameters");         std::vector<bool> returns;       F  returns.push_back(_params_nh.getParam("angle_topic", _angle_topic));     returns.push_back(   F      _params_nh.getParam("angular_velocity_topic", _velocity_topic));         std::string topic_msg_type;   N  returns.push_back(_params_nh.getParam("in_topic_msg_type", topic_msg_type));     try {   /    _topic_type = getTopicType(topic_msg_type);   %  } catch (std::invalid_argument e) {       ROS_ERROR_STREAM(e.what());       return false;     }       N  returns.push_back(_params_nh.getParam("velocity_factor", _velocity_factor));   H  returns.push_back(_params_nh.getParam("angle_factor", _angle_factor));   H  returns.push_back(_params_nh.getParam("wheel_radius", _wheel_radius));   B  returns.push_back(_params_nh.getParam("wheelbase", _wheelbase));   -  // We dont know which params are not loaded   O  return std::all_of(returns.begin(), returns.end(), [](bool v) { return v; });   }       6const ShortOdom &AckerFrontOdom::calcOdom(double dt) {5�_�                    i        ����                                                                                                                                                                                                                                                                                                                            X           h           V        `Y�     �   h   i          -  // We dont know which params are not loaded5�_�                    i        ����                                                                                                                                                                                                                                                                                                                            X           h           V        `Y�     �   h   j   �    5�_�                     X        ����                                                                                                                                                                                                                                                                                                                            X          h          V       `Y�    �   g   i          B  returns.push_back(_params_nh.getParam("wheelbase", _wheelbase));�   f   h          H  returns.push_back(_params_nh.getParam("wheel_radius", _wheel_radius));�   e   g          H  returns.push_back(_params_nh.getParam("angle_factor", _angle_factor));�   d   f          N  returns.push_back(_params_nh.getParam("velocity_factor", _velocity_factor));�   \   ^          N  returns.push_back(_params_nh.getParam("in_topic_msg_type", topic_msg_type));�   Y   [          F      _params_nh.getParam("angular_velocity_topic", _velocity_topic));�   W   Y   �      F  returns.push_back(_params_nh.getParam("angle_topic", _angle_topic));5��