<!-- 排序 -->
<view class="nav-sort oh">
  <view class="nav-sort-content">
    <block qq:for="{{search_nav_sort_list}}" qq:key="key">
      <view class="item tc fl" data-index="{{index}}" bindtap="nav_sort_event">
        <text class="cr-666">{{item.name}}</text>
        <image qq:if="{{(item.icon || null) != null}}" class="icon" src="/images/search-{{item.icon}}-icon.png" mode="aspectFill" />
      </view>
    </block>
  </view>
  <image class="screening-submit" src="/images/search-submit-icon.png" mode="aspectFill" bindtap="popup_form_event_show" />
</view>

<!-- 列表 -->
<scroll-view scroll-y="{{true}}" class="scroll-box" bindscrolltolower="scroll_lower" lower-threshold="30">
  <view class="data-list">
    <view class="items bg-white" qq:for="{{data_list}}">
      <navigator url="/pages/goods-detail/goods-detail?goods_id={{item.id}}" hover-class="none">
        <image src="{{item.images}}" mode="aspectFit" />
        <view class="base">
          <view class="single-text">{{item.title}}</view>
          <view class="price">
            <text class="sales-price">￥{{item.min_price}}</text>
          </view>
        </view>
      </navigator>
    </view>
  </view>
  
  <view qq:if="{{data_list.length == 0}}">
    <import src="/pages/common/nodata.wxml" />
    <template is="nodata" data="{{status: data_list_loding_status}}"></template>
  </view>
    
  <import src="/pages/common/bottom_line.wxml" />
  <template is="bottom_line" data="{{status: data_bottom_line_status}}"></template>
</scroll-view>

<!-- 筛选条件 popup -->
<component-popup prop-show="{{is_show_popup_form}}" prop-position="right" bindonclose="popup_form_event_close">
  <form bindsubmit="form_submit_event" class="popup-form oh bg-white">
    <view class="item oh screening-price">
      <view class="title cr-666">价格区间(元)
      </view>
      <input type="digit" placeholder="最低价" name="min_price" class="br fl" />
      <view class="cr-888 fl tc separator">~
      </view>
      <input type="digit" placeholder="最高价" name="max_price" class="br fl" />
    </view>
    <view class="item keywords">
      <view class="title cr-666">关键字</view>
      <input type="text" placeholder="关键字" name="keywords" value="{{(params.keywords || '')}}" class="br" />
    </view>
    <button formType="submit" class="bg-main form-submit wh-auto" disabled="{{popup_form_loading_status}}" hover-class="none">确认</button>
  </form>
</component-popup>