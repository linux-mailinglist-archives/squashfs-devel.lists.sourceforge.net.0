Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA636520B03
	for <lists+squashfs-devel@lfdr.de>; Tue, 10 May 2022 04:10:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1noFKD-0003zP-Db; Tue, 10 May 2022 02:10:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>) id 1no3LJ-0007nb-Bc
 for squashfs-devel@lists.sourceforge.net; Mon, 09 May 2022 13:22:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JdggUdj6Cyy3bwI4A6a6CHtU1L9T2LeN0JfrMkS7X88=; b=WQA+4DKqy7Ve0SWUshkNJCjXlq
 WDMfIxiCsVg3kKGhQXyLCKRNZx4zEU+AKgcaitBZjqeR/AoDMJ5TM2UQk7VII17hl5fjfATV4HZcw
 5Q9lGawczTU5u+CwdO8kgVJctRiHQGqDDU/3614v1+N563z90VZGE7MabEfw4oW33VmY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JdggUdj6Cyy3bwI4A6a6CHtU1L9T2LeN0JfrMkS7X88=; b=M2yw7IZ6uR3wCQtQrqN/IUx/a3
 srrJkNV50B+2nM80Tf7auD7qaaYTvdwQCBpp84CcPnr7htZkBxY/sKXrg/o9j6KXeWd82w70RNtLz
 TIkH69Tbev6Kh8EHX69vhBlCmJQWkzYnIbF1hGvBTHDx+gawJJ48zhasCKBGk46Q/3iM=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1no3L3-006E8z-VH
 for squashfs-devel@lists.sourceforge.net; Mon, 09 May 2022 13:22:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=JdggUdj6Cyy3bwI4A6a6CHtU1L9T2LeN0JfrMkS7X88=; b=OGd54kfOzMZGf7TJtvNXMhAtjf
 UjPVSXFqyFdCMYXg/C/rQjcYyMqLGOBYFnQO6phc6UMetLmgP17g2BX69Gueqvae3uDfoQU+KQErA
 VyxmD46+j3X9r+M0frtn07nO5Ixzz0akh0GX04/0k7ZPnuNVybVSoo55nFjgdcFtj1BDdbEtI19yr
 8CbzmNlLvT8xRgzpWgZE1Ggg51rBMLdOO3mCkFbEiwNcsb7z/6fWDY0SpDmDe/vpdVSbTyu0NExyf
 tc2x67gNasvBr5ClgjoTU2k42s2Knv8CjP1UaovEgoWowJyBaFbO1ROCUqHxZTLFXVe7dwxiN0Uxu
 v0JnyYsg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1no3Ka-003Ta2-AV; Mon, 09 May 2022 13:21:44 +0000
Date: Mon, 9 May 2022 14:21:44 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Xiongwei Song <sxwjean@gmail.com>, Zheng Liang <zhengliang6@huawei.com>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Zhang Yi <yi.zhang@huawei.com>, Hou Tao <houtao1@huawei.com>,
 Miao Xie <miaoxie@huawei.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YnkVaGB74xqWJqdG@casper.infradead.org>
References: <PH0PR11MB519282C2834C7BB7B5431F34ECC79@PH0PR11MB5192.namprd11.prod.outlook.com>
 <Ynfzh2ifG85MZEoN@casper.infradead.org>
 <CAJMQK-jNYoJVqsri4REV=E3bG8AS7T82HrVSAUPzbUiWask01A@mail.gmail.com>
 <CAJMQK-i3OQxcG7=LzTG4k70BP0j6PstWw0C45xcEi6iVLn_2ag@mail.gmail.com>
 <CAEVVKH-m+3+xJMbM1vRM3d=AaPSv2xg4Qx8_WPw_29JByONS8A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEVVKH-m+3+xJMbM1vRM3d=AaPSv2xg4Qx8_WPw_29JByONS8A@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, May 09, 2022 at 08:43:45PM +0800,
 Xiongwei Song wrote:
 > Hi Hsin-Yi and Matthew, > > With the patch from the attachment on linux
 5.10, ran the command as I > mentioned earlier, > got the resul [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1no3L3-006E8z-VH
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On Mon, May 09, 2022 at 08:43:45PM +0800, Xiongwei Song wrote:
> Hi Hsin-Yi and Matthew,
> 
> With the patch from the attachment on linux 5.10, ran the command as I
> mentioned earlier,
> got the results below:
> 1:40.65 (1m + 40.65s)
> 1:10.12
> 1:11.10
> 1:11.47
> 1:11.59
> 1:11.94
> 1:11.86
> 1:12.04
> 1:12.21
> 1:12.06
> 
> The performance has improved obviously, but compared to linux 4.18, the
> performance is not so good.
> 
> Moreover, I wanted to test on linux 5.18. But I think I should revert
> 9eec1d897139 ("squashfs: provide backing_dev_info in order to disable
> read-ahead"),
> right?  Otherwise, the patch doesn't work?

I've never seen patch 9eec1d897139 before.  If you're going to point
out bugs in my code, at least have the decency to cc me on it.  It
should never have gone in, and should be reverted so the problem can
be fixed properly.


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
