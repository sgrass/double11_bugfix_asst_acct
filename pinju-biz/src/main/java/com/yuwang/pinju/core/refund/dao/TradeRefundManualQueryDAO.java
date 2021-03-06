package com.yuwang.pinju.core.refund.dao;

import java.util.List;

import com.yuwang.pinju.core.common.DaoException;
import com.yuwang.pinju.core.common.ManagerException;
import com.yuwang.pinju.domain.refund.TradeRefundManualDO;


public interface TradeRefundManualQueryDAO {

	/**
	 * Created on 2011-9-15
	 * <p>Description: 查询退款工单记录</p>
	 * @param tradeRefundManualDO
	 * @return
	 * @author:[李鑫]
	 * @version 1.0
	 * @update:[日期YYYY-MM-DD] [更改人姓名]
	 */
	public List<TradeRefundManualDO> getRefundManualList(TradeRefundManualDO tradeRefundManualDO) throws DaoException;
	
	/**
	 * <p>查询手工退款工单</p>
	 *
	 * @param orderId
	 * @return 手工退款工单
	 * @throws DaoException
	 *
	 * @author shihongbo
	 */
	public TradeRefundManualDO loadRefundManualByOrderId(Long orderId) throws DaoException;
	
	/**
	 * <p>查询所有没有退款的工单</p>
	 * @return
	 * @throws DaoException
	 */
	public List<TradeRefundManualDO> selectAllTradeRefundManualNotRefund(Long refundState) throws DaoException;
	
}
