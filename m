Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C2B523DA3
	for <lists+squashfs-devel@lfdr.de>; Wed, 11 May 2022 21:35:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nos7O-000729-F7; Wed, 11 May 2022 19:35:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>) id 1noGjI-0000SQ-Lq
 for squashfs-devel@lists.sourceforge.net; Tue, 10 May 2022 03:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Fmtb6i/DJlCmwp8hbzer1RPd5jx8d+CvV707BqjKww=; b=BkgEVGRHafA7Ig0+1JMZUQhjq+
 9X4ys9qH7INz9lTDLnRK2sJKCi5kz8eOZTLypFaO36hQOARp2FcaPro/eEbhCM/cuXjWdL470BMbl
 C//KztTXFvmS4Bq1CntLrUbvtv6jg7Iv9zdfqEibtQPWQ+bmTdIkvSgO1FMAnmxBw7D8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9Fmtb6i/DJlCmwp8hbzer1RPd5jx8d+CvV707BqjKww=; b=Uk9YCwH0/NLCHouzyNlGm0DLyt
 b8/b4FH0bMyO3rZlB6olIkWNMmH6VEsZsUNbfs/A4fxmKaaLWGQT+Y9xkoMK73DcDQtprtMF/rJy3
 iFcWomgxMjEGlVJoaRM2C3vwmFEbAAYQyVCD/UlAUpA4h3KFv9HMPFPcL89o/Y51ogJ0=;
Received: from p3plsmtp14-04-2.prod.phx3.secureserver.net ([173.201.192.188]
 helo=p3plwbeout14-04.prod.phx3.secureserver.net)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1noGjF-0003xy-61
 for squashfs-devel@lists.sourceforge.net; Tue, 10 May 2022 03:40:08 +0000
Received: from mailex.mailcore.me ([94.136.40.143]) by :WBEOUT: with ESMTP
 id oGQBnZ4DN6IIdoGQCntaOr; Mon, 09 May 2022 20:20:24 -0700
X-CMAE-Analysis: v=2.4 cv=OcRdsjfY c=1 sm=1 tr=0 ts=6279d9f8
 a=EhJYbXVJKsomWlz4CTV+qA==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=IkcTkHD0fZMA:10 a=oZkIemNP1mAA:10
 a=m0AoEl9UtWfG1dJMmG4A:9 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: oGQBnZ4DN6IId
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175]
 helo=[192.168.178.33])
 by smtp03.mailcore.me with esmtpa (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>)
 id 1noGQB-0003JY-7R; Tue, 10 May 2022 04:20:23 +0100
Message-ID: <1dff431e-f51d-edb0-5abc-353ceeef50ed@squashfs.org.uk>
Date: Tue, 10 May 2022 04:20:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: Matthew Wilcox <willy@infradead.org>
References: <PH0PR11MB519282C2834C7BB7B5431F34ECC79@PH0PR11MB5192.namprd11.prod.outlook.com>
 <Ynfzh2ifG85MZEoN@casper.infradead.org>
 <CAJMQK-jNYoJVqsri4REV=E3bG8AS7T82HrVSAUPzbUiWask01A@mail.gmail.com>
 <CAJMQK-i3OQxcG7=LzTG4k70BP0j6PstWw0C45xcEi6iVLn_2ag@mail.gmail.com>
 <CAEVVKH-m+3+xJMbM1vRM3d=AaPSv2xg4Qx8_WPw_29JByONS8A@mail.gmail.com>
 <YnkVaGB74xqWJqdG@casper.infradead.org>
 <13af40a9-6b60-6875-8326-0827e34182d5@squashfs.org.uk>
 <YnnPYD+VtQB6hlnL@casper.infradead.org>
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <YnnPYD+VtQB6hlnL@casper.infradead.org>
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated: phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfD4ObEyeWnEncvJmHMO8rZsr9lQgXqv+is+/XcSb5pPdW4sUW4D7m5Wfga86MZU8F2tliXNQfYislCOFhMqGGSZavX7IRS16CMatU4XC8Lrm+kQ5vaV+
 mfBHhfVSh5UbOeA06jcs9vtv5PWNHprdO1jqUrxnNOOvucC2uCJzNIB9YVjdPQkliJs4XwH2xpnbffL9+HFTD9eN2vVBLFwtiLVlNs+0YHBn5HCcAxGoBSWw
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/05/2022 03:35, Matthew Wilcox wrote: > On Tue, May 10, 
 2022 at 02:11:41AM +0100, Phillip Lougher wrote: >> On 09/05/2022 14:21,
 Matthew Wilcox wrote: >>> On Mon, May 09, 2022 at 08:43:45PM +0800 [...] 
 Content analysis details:   (-1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [173.201.192.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1noGjF-0003xy-61
X-Mailman-Approved-At: Wed, 11 May 2022 19:35:29 +0000
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
Cc: "Song, Xiongwei" <Xiongwei.Song@windriver.com>,
 Zhang Yi <yi.zhang@huawei.com>, Xiongwei Song <sxwjean@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, open list <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>, Hou Tao <houtao1@huawei.com>,
 "squashfs-devel@lists.sourceforge.net" <squashfs-devel@lists.sourceforge.net>,
 Andrew Morton <akpm@linux-foundation.org>, Miao Xie <miaoxie@huawei.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On 10/05/2022 03:35, Matthew Wilcox wrote:
> On Tue, May 10, 2022 at 02:11:41AM +0100, Phillip Lougher wrote:
>> On 09/05/2022 14:21, Matthew Wilcox wrote:
>>> On Mon, May 09, 2022 at 08:43:45PM +0800, Xiongwei Song wrote:
>>>> Hi Hsin-Yi and Matthew,
>>>>
>>>> With the patch from the attachment on linux 5.10, ran the command as I
>>>> mentioned earlier,
>>>> got the results below:
>>>> 1:40.65 (1m + 40.65s)
>>>> 1:10.12
>>>> 1:11.10
>>>> 1:11.47
>>>> 1:11.59
>>>> 1:11.94
>>>> 1:11.86
>>>> 1:12.04
>>>> 1:12.21
>>>> 1:12.06
>>>>
>>>> The performance has improved obviously, but compared to linux 4.18, the
>>>> performance is not so good.
>>>>
>>>> Moreover, I wanted to test on linux 5.18. But I think I should revert
>>>> 9eec1d897139 ("squashfs: provide backing_dev_info in order to disable
>>>> read-ahead"),
>>>> right?  Otherwise, the patch doesn't work?
>>>
>>> I've never seen patch 9eec1d897139 before.  If you're going to point
>>> out bugs in my code, at least have the decency to cc me on it.  It
>>> should never have gone in, and should be reverted so the problem can
>>> be fixed properly.
>>
>> You are not in charge of what patches goes into Squashfs, that is my
>> perogative as maintainer of Squashfs.
> 
> I think you mean 'prerogative'.  And, no, your filesystem is not your
> little fiefdom, it's part of a collaborative effort.
> 

This isn't a spelling contest, and if that's the best you can do you
have already failed.

Be carefull here also, I have been maintainer of Squashfs for 20 years,
and was kernel maintainer for both Ubuntu and Redhat for 10 years, and
so I am experienced member of the community.

You reply is bordering on offensive and arrogant, especially considering
it is unwarranted.  I did not set out to offend you, and I don't
appreciate it.

About 8 years ago I decided to refrain from active involvement in the
kernel community, because I decided the level of discourse was
disgusting, and I had enough of it.

I poped up now to defend my approval of the Huawei patch.  I am *quite*
happy not to have any more involvement until necessary.

So having said what I want to say, I will leave it at that. You have
just proved why I have minimised my involvement.

No doubt you'll throw your toys out the pram, but, I'm no
longer listening so don't bother.


>> That patch (by Huawei) fixes the performance regression in Squashfs
>> by disabling readahead, and it is good workaround until something
>> better.
> 
> You *didn't even report the problem to me*.  How can it be fixed if I'm
> not aware of it?
> 

There was a email discussion last year, which I responded to, and got
ignored.  I will find it out tomorrow, perhaps.  But I will probably
not bother, because life is too short.

Cheers

Phillip


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
