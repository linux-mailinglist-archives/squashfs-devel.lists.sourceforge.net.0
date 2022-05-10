Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5B8523DA0
	for <lists+squashfs-devel@lfdr.de>; Wed, 11 May 2022 21:35:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nos7O-000725-Dd; Wed, 11 May 2022 19:35:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>) id 1noFiu-0004V6-R2
 for squashfs-devel@lists.sourceforge.net; Tue, 10 May 2022 02:35:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XUkwOFXROi4n/GY3pu0CZCq+Y5OOHTHprsmPZOti5h0=; b=nRLkQ9Then1SFZgPTGVD5kLCXd
 yZDTB4F0dTpxMVbxBofcLm+Q/uIiN4nHFaN+KXmea5L+vP8UlzLfzZ+o+1IL4++laVAxjc6M5I1T8
 J4hD5qatMWcnRJI+ePw8LtVBWw4JlCJ6GGs2T5jnzgOQUpfxVtOj8ADZqdvaag9+JRCc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XUkwOFXROi4n/GY3pu0CZCq+Y5OOHTHprsmPZOti5h0=; b=fNblT67HsCk5x+9hselY62EJlc
 Yq8VQcL6bWeUA5yQk4XncyfEaJrXkHp3xD4qKjrbxY96wQsAWQwtTXYl5UAtfMbQ+Qkc6/ckXFvnv
 l2r45RlQqwi7bHaxhjP4duyKeTdFbAq1qHf+z3nZcfrjUtDB3QUwmsJOFDLDwFpQa0uU=;
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1noFit-0006M1-4W
 for squashfs-devel@lists.sourceforge.net; Tue, 10 May 2022 02:35:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=XUkwOFXROi4n/GY3pu0CZCq+Y5OOHTHprsmPZOti5h0=; b=oyTJezF1mulzIGpesv3Xts35aX
 cT7DAS1CfXz/yAS5QGy2DtKvenwygmXf45Q2RsS9IKvaPyjRHWkoc51bHqQeT2xMsVBuLltU5nhYU
 GqePNycjKjA+W6oFTp0uarIVOm11I8CvI7kTPz3Z5rMPo32NsOcB/10pv9LTv7bjI91cafrhM6IXW
 xnGH2Y1QxBLzgnh4Jheup5KIN30Ws94XadMotwhfAoi7YCtPUO4U8x2ycF0QQB3cX2KWTaiYIA1bM
 KRkMTA60sCoxUWGK0X7hPKnIyZod0WlRY3vr8TO5eKEPFRLe2rWCES/AYADa1TSfFehbBeZ6qFk4F
 7Z29xspg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1noFiS-0041Os-2J; Tue, 10 May 2022 02:35:12 +0000
Date: Tue, 10 May 2022 03:35:12 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Phillip Lougher <phillip@squashfs.org.uk>
Message-ID: <YnnPYD+VtQB6hlnL@casper.infradead.org>
References: <PH0PR11MB519282C2834C7BB7B5431F34ECC79@PH0PR11MB5192.namprd11.prod.outlook.com>
 <Ynfzh2ifG85MZEoN@casper.infradead.org>
 <CAJMQK-jNYoJVqsri4REV=E3bG8AS7T82HrVSAUPzbUiWask01A@mail.gmail.com>
 <CAJMQK-i3OQxcG7=LzTG4k70BP0j6PstWw0C45xcEi6iVLn_2ag@mail.gmail.com>
 <CAEVVKH-m+3+xJMbM1vRM3d=AaPSv2xg4Qx8_WPw_29JByONS8A@mail.gmail.com>
 <YnkVaGB74xqWJqdG@casper.infradead.org>
 <13af40a9-6b60-6875-8326-0827e34182d5@squashfs.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13af40a9-6b60-6875-8326-0827e34182d5@squashfs.org.uk>
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, May 10, 2022 at 02:11:41AM +0100, Phillip Lougher
 wrote: > On 09/05/2022 14:21, Matthew Wilcox wrote: > > On Mon, May 09, 2022
 at 08:43:45PM +0800, Xiongwei Song wrote: > > > Hi Hsin-Yi and Ma [...] 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1noFit-0006M1-4W
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
 Hsin-Yi Wang <hsinyi@chromium.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>, Hou Tao <houtao1@huawei.com>,
 "squashfs-devel@lists.sourceforge.net" <squashfs-devel@lists.sourceforge.net>,
 Andrew Morton <akpm@linux-foundation.org>, Miao Xie <miaoxie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On Tue, May 10, 2022 at 02:11:41AM +0100, Phillip Lougher wrote:
> On 09/05/2022 14:21, Matthew Wilcox wrote:
> > On Mon, May 09, 2022 at 08:43:45PM +0800, Xiongwei Song wrote:
> > > Hi Hsin-Yi and Matthew,
> > > 
> > > With the patch from the attachment on linux 5.10, ran the command as I
> > > mentioned earlier,
> > > got the results below:
> > > 1:40.65 (1m + 40.65s)
> > > 1:10.12
> > > 1:11.10
> > > 1:11.47
> > > 1:11.59
> > > 1:11.94
> > > 1:11.86
> > > 1:12.04
> > > 1:12.21
> > > 1:12.06
> > > 
> > > The performance has improved obviously, but compared to linux 4.18, the
> > > performance is not so good.
> > > 
> > > Moreover, I wanted to test on linux 5.18. But I think I should revert
> > > 9eec1d897139 ("squashfs: provide backing_dev_info in order to disable
> > > read-ahead"),
> > > right?  Otherwise, the patch doesn't work?
> > 
> > I've never seen patch 9eec1d897139 before.  If you're going to point
> > out bugs in my code, at least have the decency to cc me on it.  It
> > should never have gone in, and should be reverted so the problem can
> > be fixed properly.
> 
> You are not in charge of what patches goes into Squashfs, that is my
> perogative as maintainer of Squashfs.

I think you mean 'prerogative'.  And, no, your filesystem is not your
little fiefdom, it's part of a collaborative effort.

> That patch (by Huawei) fixes the performance regression in Squashfs
> by disabling readahead, and it is good workaround until something
> better.

You *didn't even report the problem to me*.  How can it be fixed if I'm
not aware of it?



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
