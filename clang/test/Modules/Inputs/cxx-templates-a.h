template<typename T> T f() { return T(); }
template<typename T> T f(T);
namespace N {
  template<typename T> T f() { return T(); }
  template<typename T> T f(T);
}

template<int N> int template_param_kinds_1();
template<template<typename T, int, int> class> int template_param_kinds_2();
template<template<typename T, typename U, T> class> int template_param_kinds_3();
