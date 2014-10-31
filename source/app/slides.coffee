
React = require 'react'
$ = React.DOM

line = (x) ->
  $.div className: 'line', x

link = (x) ->
  $.a className: 'link', href: x, target: '_blank', x

code = (x) ->
  $.pre className: 'code', x

pic = (x) ->
  $.img src: x

module.exports = [
  title: '关于我'
  content: $.div className: 'slide',
    line 'ChenYong, 题叶, CoffeeScript, Go'
    pic 'http://tp1.sinaimg.cn/1651843872/180/40048616024/1'
    link 'http://tiye.me'
    line 'Teambition, 前端, 单页面应用'
    line 'Node.js 做聊天工具, Socket.IO'
,
  title: '关于分享'
  content: $.div className: 'slide',
    line '第一次分享...紧张'
    line '多少人写过 React?'
    link 'http://repo.tiye.me/cnodejs-slide'
    line 'React 实现的'
    line 'Todolist, 只是看一下代码, 3 个小时'
,
  title: 'React'
  content: $.div className: 'slide',
    code """
      React.render(
        <h1>Hello, world!</h1>,
        document.getElementById('example')
      );
      """
    pic 'http://oss.org.cn/attachments/2013/12/1_201312251544342d00D.jpg'
,
  title: 'React 是什么'
  content: $.div className: 'slide',
    line 'Instagram 网站的框架, 用在 Facebook, Pete Hunt'
    line 'MVC 当中的 V, 不是完整的框架'
    line '数据更新 -> 自动渲染 View, 不是双向绑定'
    line '大小类似 jQuery, 更架构化的 DOM 操作和事件系统'
,
  title: 'Component'
  content: $.div className: 'slide',
    line 'Component, 类似模版的 Partial'
    line '基于 DOM, 能处理事件, 不是整个刷新'
    code 'React.createClass'
    line '不可变的属性 props, 状态 state, setState'
    link 'https://github.com/uberVU/react-guide/blob/master/props-vs-state.md'
,
  title: '什么是 JSX'
  content: $.div className: 'slide',
    link 'http://facebook.github.io/react/jsx-compiler.html'
    link 'http://facebook.github.io/jsx/'
    line '建构工具, 单纯手写'
    code """
      React.render(
        React.createElement('h1', null, 'Hello, world!'),
        document.getElementById('example')
      );
    """
,
  title: '什么是 Virtual DOM?'
  content: $.div className: 'slide',
    line 'Diff Checking -> DOM Diff'
    line '访问 DOM 性能低, 使用 JavaScript 数据表示速度更快'
    line '不受浏览器环境的依赖'
    link 'http://segmentfault.com/blog/jiyinyiyong/1190000000606216'
    line "The Secrets of React's Virtual DOM"
    link 'http://www.tudou.com/programs/view/c-3WCV5W72M/'
    line 'Elm, Famo.us'
,
  title: '什么是 Flux?'
  content: $.div className: 'slide',
    line '单向数据流'
    line '传统 MVC, 大量的 Model 和 View, 数据拷贝需要维护, 相互间关系复杂'
    line '用户 -> Action -> Dispatcher -> Store -> View -> Action'
    link 'https://github.com/facebook/flux'
    link 'http://fluxxor.com/'
,
  title: '架构图'
  content: $.div className: 'slide',
    pic 'http://www.infoq.com/resource/news/2014/05/facebook-mvc-flux/en/resources/flux-react-mvc.png'
    line '变成'
    pic 'http://www.infoq.com/resource/news/2014/05/facebook-mvc-flux/en/resources/flux-react.png'
,
  title: '解决什么问题?'
  content: $.div className: 'slide',
    line '更好地模块化, 更容易维护, 低版本浏览器'
    line '相比 jQuery, React 能容易更多的 DOM'
    line '相比 Angular, React Component 非常灵活'
,
  title: '整个页面更新'
  content: $.div className: 'slide',
    line '初衷, XHP 后端绘制页面的方式带到前端'
    line 'Model Driven View 带来效率提升, 比如 MVVM'
    line '就像服务端渲染的页面, 但是不会丢失用户浏览的状态'
,
  title: '关于性能'
  content: $.div className: 'slide',
    line 'DOM 操作默认使用优化, 比如批量更新'
    line 'Om(ClojureScript), 不可变数据'
    line 'shouldComponentUpdate 优化减少刷新'
,
  title: '用状态取代过程'
  content: $.div className: 'slide',
    line 'Facebook 的例子, 数据被其他的代码改了, 不容易维护'
    line '界面对应 props 和 state, 更有预测性'
    line '编程思想更清晰, 服务器渲染过模版就知道'
    line '缺点: 没有事件传递, 共享事件和方法逐个模块传入, 可能很深'
,
  title: 'DOM 的限制较多'
  content: $.div className: 'slide',
    line 'Component 的父子关系, 限制了 DOM 结构'
    line '如果用 jQuery, 更容易出问题, 但很方便实现功能'
    line '发现 CSS transition 被 DOM 的增加删除打断'
    line 'Famo.us'
,
  title: '谁在用'
  content: $.div className: 'slide',
    line 'Instagram, Facebook, Khan Academy, Netflix, Reddit, AirBnB'
    line 'Atom Editor, Brackets Editor'
    link 'https://github.com/facebook/react/wiki/Sites-Using-React'
    link 'http://www.zhihu.com/question/26387853'
,
  title: '前后端共用代码'
  content: $.div className: 'slide',
    line '浏览器'
    code """
      ReactComponent render(
        ReactElement element,
        DOMElement container,
        [function callback]
      )
      """
    line '服务器'
    code 'string renderToString(ReactComponent component)'
,
  title: '看一个 Todolist 的实现'
  content: $.div className: 'slide',
    link 'http://facebook.github.io/react/docs/tutorial.html'
    link 'https://github.com/tastejs/todomvc/tree/gh-pages/examples/react'
    line '服务器/浏览器渲染, 禁用/开启 JavaScript'
    link 'http://repo.tiye.me:3100'
    link 'https://github.com/mvc-works/isomorphic-todolist'
    link 'https://github.com/Memkits/react-todolist'
,
  title: 'Q&A'
  content: $.div className: 'slide',
    link 'http://weibo.com/reactchina'
    link 'http://react-china.org'
    link 'http://www.tudou.com/plcover/xsb8ZVc3wK4/'
    link 'http://segmentfault.com/t/reactjs'
]