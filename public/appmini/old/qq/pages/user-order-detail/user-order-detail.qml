<view qq:if="{{detail != null}}">
  <view class="address bg-white spacing-mb">
      <view class="address-base oh">
          <text>{{detail.receive_name}}</text>
          <text class="fr">{{detail.receive_tel}}</text>
      </view>
      <view class="address-detail oh">
          <image class="icon fl" src="/images/user-address.png" mode="widthFix" />
          <view class="text fr">{{detail.receive_province_name}}{{detail.receive_city_name}}{{detail.receive_county_name}}{{detail.receive_address}}</view>
      </view>
  </view>

  <view class="goods bg-white spacing-mb">
      <view qq:for="{{detail.items}}" qq:key="item" class="goods-item oh">
        <navigator url="/pages/goods-detail/goods-detail?goods_id={{item.goods_id}}" hover-class="none">
          <image class="goods-image fl" src="{{item.images}}" mode="aspectFill" />
          <view class="goods-base">
            <view class="goods-title multi-text">{{item.title}}</view>
            <block qq:if="{{item.spec != null}}">
              <view class="goods-attribute cr-888" qq:for="{{item.spec}}" qq:key="spec" qq:for-item="spec">
                {{spec.type}}:{{spec.value}}
              </view>
            </block>
          </view>
          <view class="oh goods-price">
            <text class="sales-price">￥{{item.price}}</text>
            <text qq:if="{{item.original_price > 0}}" class="original-price">￥{{item.original_price}}</text>
            <text class="buy-number">x{{item.buy_number}}</text>
          </view>
        </navigator>
      </view>
  </view>

  <!-- 订单基础数据 -->
  <view qq:if="{{detail_list.length > 0}}" class="detail-list bg-white">
    <view qq:for="{{detail_list}}" qq:key="item" class="item br-b oh">
      <view class="title fl">{{item.name}}</view>
      <view class="content cr-888 fl br-l">{{item.value}}</view>
    </view>
  </view>

  <!-- 扩展数据 -->
  <view qq:if="{{extension_data.length > 0}}" class="extension-list bg-white  spacing-mt">
    <view qq:for="{{extension_data}}" qq:key="item" class="item br-b oh">
      <text class="title">{{item.name}}</text>
      <text class="content cr-888 br-l">{{item.tips}}</text>
    </view>
  </view>

  <import src="/pages/common/bottom_line.wxml" />
  <template is="bottom_line" data="{{status: data_bottom_line_status}}"></template>
</view>

<view qq:if="{{detail == null}}">
    <import src="/pages/common/nodata.wxml" />
    <template is="nodata" data="{{status: data_list_loding_status, msg: data_list_loding_msg}}"></template>
</view>

<view class="nav-back tc wh-auto">
  <navigator url="/pages/user-order/user-order" open-type="navigateBack" hover-class="none">
    <button type="default" size="mini" class="cr-888 br" hover-class="none">返回</button>
  </navigator>
</view>