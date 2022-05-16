Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C29C052E352
	for <lists+squashfs-devel@lfdr.de>; Fri, 20 May 2022 05:45:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nrtZj-0007Jj-OI; Fri, 20 May 2022 03:45:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>) id 1nqaGP-0007eB-7E
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 12:55:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=beBrIscqgy/0uR/o+DxDTi2opTq7h59zNaTA5248BaE=; b=kGOpgKZIl/m1NQKXKZGxE9ixm2
 v28+lW8SoHZJFFx/oM5TkypR5H5oaz8mhlFZCYNyI4uRfuvajkq6/nNSvYKyLNhZrlNxYGbgfla3x
 Lhbep+49OgM+rsOoK00TeWCQDeH4+/dPmebHWT+CBUo8xN/xvcfEGs5VYQIQqhaoI1Xc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=beBrIscqgy/0uR/o+DxDTi2opTq7h59zNaTA5248BaE=; b=Es+U1b5Rearh8a1PpThxtgUj/6
 HhCrwTKp8EAFSZrLJtM4A+kYoNGMzkOO6St64s3Of6wvmDDA6vmfGQI1fh+ce79X/amooEyIn1Izl
 asFQ3pBJFUhOjmbq647BmZGfUCnlhjRqdrVjcIZLYa7YJit/tVLMZoZ/1Hhy8PJd+o5E=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nqaGN-0005Uh-91
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 12:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=beBrIscqgy/0uR/o+DxDTi2opTq7h59zNaTA5248BaE=; b=cO6FBmkT8y7IKKung2vpOoIQ5k
 7oOqh/CYnFPlnrU1EfIvPKMMRYCfHUNrp+7WbU3R72a4bEDHzoZlyVdwo8TF+7+VIz/8amLZBTKGV
 QeMJJwfl5Y5/9RDq362odnkReBqFLN8g8Yi4qs7+NBJdR3DbbowtGGj73pAq+hZP6IzTisv/seGF9
 VYEjTKO/fJ6jX9hpEHz6iMwSxpwQ9NdL3QgV27N4fQ4O8BIkeE3Hx7/8EybgwipWcPjrUklCEu86N
 MPPSZz1FSuISFDZYMmi2zwZNQDhzLaImM0nX+2F9auL5AwD3M7Wli7Dyz6RURKO4RR550eZ101FAe
 iFv1tLlA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nqaFx-009tNO-NU; Mon, 16 May 2022 12:55:25 +0000
Date: Mon, 16 May 2022 13:55:25 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Message-ID: <YoJJvabBCTJHryGm@casper.infradead.org>
References: <20220516105100.1412740-1-hsinyi@chromium.org>
 <20220516105100.1412740-3-hsinyi@chromium.org>
 <CAJMQK-jjNRuZFOJrd2knQHwPERaJ64pyys+14cCVyfdsP1GZSQ@mail.gmail.com>
 <YoJFOpbMYSEOGfXy@casper.infradead.org>
 <CAJMQK-iDFJGHzmJQ0VZRXL-O8MBeqLFS-b0M-6bm3ncZ4TgMJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJMQK-iDFJGHzmJQ0VZRXL-O8MBeqLFS-b0M-6bm3ncZ4TgMJQ@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, May 16, 2022 at 08:47:52PM +0800, Hsin-Yi Wang wrote:
 > On Mon, May 16, 2022 at 8:36 PM Matthew Wilcox <willy@infradead.org> wrote:
 > > > > On Mon, May 16, 2022 at 07:04:08PM +0800, Hsin-Yi Wa [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nqaGN-0005Uh-91
X-Mailman-Approved-At: Fri, 20 May 2022 03:45:11 +0000
Subject: Re: [Squashfs-devel] [PATCH 2/2] squashfs: implement readahead
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
Cc: Xiongwei Song <Xiongwei.Song@windriver.com>, Zhang Yi <yi.zhang@huawei.com>,
 linux-kernel@vger.kernel.org, "linux-mm @ kvack . org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>,
 "squashfs-devel @ lists . sourceforge . net"
 <squashfs-devel@lists.sourceforge.net>, Hou Tao <houtao1@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, Miao Xie <miaoxie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On Mon, May 16, 2022 at 08:47:52PM +0800, Hsin-Yi Wang wrote:
> On Mon, May 16, 2022 at 8:36 PM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Mon, May 16, 2022 at 07:04:08PM +0800, Hsin-Yi Wang wrote:
> > > > +       loff_t req_end = readahead_pos(ractl) + readahead_length(ractl);
> > > > +       loff_t start = readahead_pos(ractl) &~ mask;
> > > > +       size_t len = readahead_length(ractl) + readahead_pos(ractl) - start;
> > > > +       struct squashfs_page_actor *actor;
> > > > +       unsigned int nr_pages = 0;
> > > > +       struct page **pages;
> > > > +       u64 block = 0;
> > > > +       int bsize, res, i, index;
> > > > +       int file_end = i_size_read(inode) >> msblk->block_log;
> > > > +       unsigned int max_pages = 1UL << shift;
> > > > +
> > > > +       readahead_expand(ractl, start, (len | mask) + 1);
> > > > +
> > > > +       if (readahead_pos(ractl) + readahead_length(ractl) < req_end ||
> > > > +           file_end == 0)
> > > > +               return;
> >
> > What's the first half of this condition supposed to be checking for?
> > It seems to be checking whether readahead_expand() shrunk the range
> > covered by the ractl, but readahead_expand() never does that, so I'm
> > confused why you're checking for it.
> 
> hi Matthew,
> 
> This is to check if readahead_expand() expands as much as it's requested.
> I didn't encounter the mismatch so far in my testing. If this check is
> not necessary, it can be removed.

Then I think req_end is miscalculated?  It should surely be:

	req_end = start + (len | mask) + 1;

But I'm not sure that we should be failing under such circumstances.
For example, we may have been asked to read 1.5MB, attempt to round up
to 2MB, and fail.  But we can still submit a readahead for the first 1MB,
before leaving the second 512kB for readpage to handle.

So maybe we should just remove this check entirely.


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
