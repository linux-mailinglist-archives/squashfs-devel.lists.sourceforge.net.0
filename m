Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A03FF520AFF
	for <lists+squashfs-devel@lfdr.de>; Tue, 10 May 2022 04:10:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1noFKD-0003zY-Gg; Tue, 10 May 2022 02:10:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>) id 1noEiw-0000Pd-9V
 for squashfs-devel@lists.sourceforge.net; Tue, 10 May 2022 01:31:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YBz6mopprwU3E6epS7vImrKEHsQtcgWwQAd5ThbnL2Y=; b=ElSeTXJNu2I9xeGxpu8FNs6txM
 bBQ861UDpUVaS+lBqc7Mb3DoaHwb9kny4PLWu8XWpKglhATy0BBL/V93w5N4dEAS9ip3KgOMIJHGu
 uoxge9mO11KWk0Bfg5/IKYHHAOg+tjx3YpIckWQJJklAgUw1oRqp+1ohOL972A3qEaIU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YBz6mopprwU3E6epS7vImrKEHsQtcgWwQAd5ThbnL2Y=; b=XjOodLeWbnt4Gwxr7nH1auAprp
 eTCD/7jekyQFKbxA1c7IG2+k61JrnAsF+HnIaTydvNc5sFI7DIDn9HYtUPOPXlWGetNz8IYee5EnV
 HuD493zt0a//AATVJI4FqlvE1MSzy2yd1NWCQ712fe8Pv4aKWgC8q/gyqZxqJz8jzUgM=;
Received: from p3plsmtp23-05-2.prod.phx3.secureserver.net ([68.178.252.170]
 helo=p3plwbeout23-05.prod.phx3.secureserver.net)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1noEiq-006uBN-7B
 for squashfs-devel@lists.sourceforge.net; Tue, 10 May 2022 01:31:37 +0000
Received: from mailex.mailcore.me ([94.136.40.145]) by :WBEOUT: with ESMTP
 id oEPjn6v2SO8bHoEPknEhs7; Mon, 09 May 2022 18:11:48 -0700
X-CMAE-Analysis: v=2.4 cv=F/iSyotN c=1 sm=1 tr=0 ts=6279bbd4
 a=7e6w4QD8YWtpVJ/7+iiidw==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=IkcTkHD0fZMA:10 a=oZkIemNP1mAA:10
 a=fvODBAn_XVqumbcpjn4A:9 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: oEPjn6v2SO8bH
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175]
 helo=[192.168.178.33])
 by smtp01.mailcore.me with esmtpa (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>)
 id 1noEPi-00077G-H2; Tue, 10 May 2022 02:11:46 +0100
Message-ID: <13af40a9-6b60-6875-8326-0827e34182d5@squashfs.org.uk>
Date: Tue, 10 May 2022 02:11:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: Matthew Wilcox <willy@infradead.org>, Xiongwei Song <sxwjean@gmail.com>,
 Zheng Liang <zhengliang6@huawei.com>, Zhang Yi <yi.zhang@huawei.com>,
 Hou Tao <houtao1@huawei.com>, Miao Xie <miaoxie@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <PH0PR11MB519282C2834C7BB7B5431F34ECC79@PH0PR11MB5192.namprd11.prod.outlook.com>
 <Ynfzh2ifG85MZEoN@casper.infradead.org>
 <CAJMQK-jNYoJVqsri4REV=E3bG8AS7T82HrVSAUPzbUiWask01A@mail.gmail.com>
 <CAJMQK-i3OQxcG7=LzTG4k70BP0j6PstWw0C45xcEi6iVLn_2ag@mail.gmail.com>
 <CAEVVKH-m+3+xJMbM1vRM3d=AaPSv2xg4Qx8_WPw_29JByONS8A@mail.gmail.com>
 <YnkVaGB74xqWJqdG@casper.infradead.org>
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <YnkVaGB74xqWJqdG@casper.infradead.org>
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated: phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfFUroNZkXCrLak2B2ZryBv9xoK5XEDavCINvxVcQ31ewc4oKNcUXn7e6dDSeaEloGFVPHX/0KJeH3JffZnlPSVuc/vOq2EEIhPBtQ1Gv/t+iQpeH0J2Z
 2cKOlMAWY8i5y+ffpQPnwhFocQM9yne4jyuTh4WIRVAkbDJ9Ao0tDKLqX5llFew2ncEKZQjo7Ls4+OSIWb54DkqM4Vpzr2HbPa4M+dT9hkhuG4RaeZ4gLNB9
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 09/05/2022 14:21, Matthew Wilcox wrote: > On Mon, May 09, 
 2022 at 08:43:45PM +0800, Xiongwei Song wrote: >> Hi Hsin-Yi and Matthew,
 >> >> With the patch from the attachment on linux 5.10, ran the c [...] 
 Content analysis details:   (-1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [68.178.252.170 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1noEiq-006uBN-7B
X-Mailman-Approved-At: Tue, 10 May 2022 02:10:09 +0000
Subject: Re: [Squashfs-devel] squashfs performance regression and readahea
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "Song,
 Xiongwei" <Xiongwei.Song@windriver.com>,
 "squashfs-devel@lists.sourceforge.net" <squashfs-devel@lists.sourceforge.net>,
 Hsin-Yi Wang <hsinyi@chromium.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On 09/05/2022 14:21, Matthew Wilcox wrote:
> On Mon, May 09, 2022 at 08:43:45PM +0800, Xiongwei Song wrote:
>> Hi Hsin-Yi and Matthew,
>>
>> With the patch from the attachment on linux 5.10, ran the command as I
>> mentioned earlier,
>> got the results below:
>> 1:40.65 (1m + 40.65s)
>> 1:10.12
>> 1:11.10
>> 1:11.47
>> 1:11.59
>> 1:11.94
>> 1:11.86
>> 1:12.04
>> 1:12.21
>> 1:12.06
>>
>> The performance has improved obviously, but compared to linux 4.18, the
>> performance is not so good.
>>
>> Moreover, I wanted to test on linux 5.18. But I think I should revert
>> 9eec1d897139 ("squashfs: provide backing_dev_info in order to disable
>> read-ahead"),
>> right?  Otherwise, the patch doesn't work?
> 
> I've never seen patch 9eec1d897139 before.  If you're going to point
> out bugs in my code, at least have the decency to cc me on it.  It
> should never have gone in, and should be reverted so the problem can
> be fixed properly.

You are not in charge of what patches goes into Squashfs, that is my
perogative as maintainer of Squashfs.

That patch (by Huawei) fixes the performance regression in Squashfs
by disabling readahead, and it is good workaround until something
better.

If the patch being worked-on now, once reviewed is acceptable, it can
replace the current workaround, which will be reverted.

Cheers

Dr. Phillip Lougher
--
Squashfs author and maintainer.





_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
